class ExtremeEvent:

    def __init__(self, code, description):
        self.code = code
        self.description = description

    def __repr__(self):
        return f"{self.code} -- {self.description}"
