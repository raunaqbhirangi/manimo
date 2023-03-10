"""Custom types for manimo"""
from enum import Enum
import numpy as np
import numpy.typing as npt
from typing import Any, Callable, Dict, Tuple, TypeVar


class ActionSpace(Enum):
    Joint='Joint'
    Cartesian='Cartesian'

class IKMode(Enum):
    DMControl='DMControl'
    Polymetis='Polymetis'

ObsType = TypeVar("ObsType", np.ndarray, npt.ArrayLike)
ObsDict = Dict[str, ObsType]