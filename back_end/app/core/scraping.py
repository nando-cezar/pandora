from abc import abstractmethod, ABC


class Scraping(ABC):
    @abstractmethod
    def execute(self, **kwargs):
        pass
