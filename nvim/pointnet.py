import torch
import torch.nn as nn
import torch.nn.functional as F


class PointNetEncoder(nn.Module):
    def __init__(self, C=3, dropout_rate=0.3):
        super(PointNetEncoder, self).__init__()
        self.C = C
        self.conv1 = nn.Conv1d(C, 64, 1)
        self.conv2 = nn.Conv1d(64, 128, 1)
        self.conv3 = nn.Conv1d(128, 1024, 1)
        self.bn1 = nn.BatchNorm1d(64)
        self.bn2 = nn.BatchNorm1d(128)
        self.bn3 = nn.BatchNorm1d(1024)
        self.dropout = nn.Dropout(p=dropout_rate)

    def forward(self, x):
        B, _, _ = x.shape
        x = F.relu(self.bn1(self.conv1(x)))
        x = F.relu(self.bn2(self.conv2(x)))
        x = F.relu(self.bn3(self.conv3(x)))
        x = torch.max(x, 2, keepdim=True)[0]
        x = x.view(B, -1)
        return self.dropout(x)


class PointNetClassificationHead(nn.Module):
    def __init__(self, feature_dim=1024, num_classes=10, dropout_rate=0.3):
        super(PointNetClassificationHead, self).__init__()
        self.fc1 = nn.Linear(feature_dim, 512)
        self.fc2 = nn.Linear(512, 256)
        self.fc3 = nn.Linear(256, num_classes)
        self.bn1 = nn.BatchNorm1d(512)
        self.bn2 = nn.BatchNorm1d(256)
        self.dropout = nn.Dropout(p=dropout_rate)

    def forward(self, x):
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        x = self.fc3(x)
        return F.log_softmax(x, dim=1)


class PointNetSegmentationHead(nn.Module):
    def __init__(self, feature_dim=1024, num_classes=50, dropout_rate=0.3):
        super(PointNetSegmentationHead, self).__init__()
        self.num_classes = num_classes
        self.conv1 = nn.Conv1d(feature_dim + 64, 512, 1)
        self.conv2 = nn.Conv1d(512, 256, 1)
        self.conv3 = nn.Conv1d(256, 128, 1)
        self.conv4 = nn.Conv1d(128, num_classes, 1)
        self.bn1 = nn.BatchNorm1d(512)
        self.bn2 = nn.BatchNorm1d(256)
        self.bn3 = nn.BatchNorm1d(128)
        self.dropout = nn.Dropout(p=dropout_rate)

    def forward(self, point_features, global_features):
        B, _, N = point_features.shape
        global_features = global_features.view(B, -1, 1).repeat(1, 1, N)
        x = torch.cat([point_features, global_features], dim=1)
        x = F.relu(self.bn1(self.conv1(x)))
        x = self.dropout(x)
        x = F.relu(self.bn2(self.conv2(x)))
        x = self.dropout(x)
        x = F.relu(self.bn3(self.conv3(x)))
        x = self.conv4(x)
        return F.log_softmax(x, dim=1)


class PointNet(nn.Module):
    def __init__(self, C=3, num_classes=10, task="classification", dropout_rate=0.3):
        super(PointNet, self).__init__()
        self.encoder = PointNetEncoder(C=C, dropout_rate=dropout_rate)
        self.task = task

        if task == "classification":
            self.head = PointNetClassificationHead(
                num_classes=num_classes, dropout_rate=dropout_rate
            )
        elif task == "segmentation":
            self.head = PointNetSegmentationHead(
                num_classes=num_classes, dropout_rate=dropout_rate
            )
        else:
            raise ValueError("task must be 'classification' or 'segmentation'")

    def forward(self, x):
        if self.task == "classification":
            features = self.encoder(x)
            return self.head(features)
        elif self.task == "segmentation":
            # B, C, N = x.shape
            point_features = F.relu(self.encoder.bn1(self.encoder.conv1(x)))
            global_features = self.encoder(x)
            return self.head(point_features, global_features)


if __name__ == "__main__":
    # Test classification
    model_cls = PointNet(C=3, num_classes=10, task="classification")
    x = torch.randn(8, 3, 1024)  # batch_size=8, channels=3, points=1024
    out_cls = model_cls(x)
    print(f"Classification output shape: {out_cls.shape}")
    
    # Test segmentation
    model_seg = PointNet(C=3, num_classes=50, task="segmentation")
    out_seg = model_seg(x)
    print(f"Segmentation output shape: {out_seg.shape}")
    
    print("PointNet test completed successfully!")
