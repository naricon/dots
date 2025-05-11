#===============================================================================
#   Author: (c) 2024 Andrea Alberti
#===============================================================================

from .opener import OpenerType, SchemeEntry, PreHandledMatch, PostHandledMatch
from .schemes import heuristic_find_file
from .configs import configs
from .colors import colors

__all__ = ["OpenerType", "SchemeEntry", "colors", "configs", "heuristic_find_file", "PreHandledMatch", "PostHandledMatch"]
