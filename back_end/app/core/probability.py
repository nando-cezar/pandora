from abc import abstractmethod, ABC


class Probability(ABC):
    @abstractmethod
    def calculate(self, **kwargs):
        pass
