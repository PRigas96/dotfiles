import torch
import matplotlib.pyplot as plt


class net(torch.nn.Module):
    def __init__(self):
        super(net, self).__init__()
        self.fc1 = torch.nn.Linear(2, 2)
        self.fc2 = torch.nn.Linear(2, 2)

    def forward(self, x):
        return x


def dummy():
    print(torch.__version__)
    print(torch.cuda.is_available())
    print(torch.cuda.device_count())

    print(torch.cuda.get_device_name(0))


dummy()


def plot2d():

    x = torch.randn((100, 2))
    plt.scatter(x[:, 0], x[:, 1], c="r", marker="x")
    plt.show()
