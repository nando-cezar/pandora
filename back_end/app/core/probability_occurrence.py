from abc import abstractmethod, ABC


class ProbabilityOccurrence(ABC):
    @abstractmethod
    def calculate(self):
        pass