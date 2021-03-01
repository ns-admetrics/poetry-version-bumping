try:
    import importlib.metadata as importlib_metadata
except ModuleNotFoundError:
    import importlib_metadata

# __version__ shouldn't be used anymore in the first place, but this reads it out,
# from installed package metadata - if the package is actually installed
try:
    __version__ = importlib_metadata.version(__package__)
except:
    pass

del importlib_metadata

