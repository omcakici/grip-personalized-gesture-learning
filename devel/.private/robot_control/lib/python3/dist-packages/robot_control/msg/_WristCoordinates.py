# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from robot_control/WristCoordinates.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import robot_control.msg

class WristCoordinates(genpy.Message):
  _md5sum = "5df8eb49232da68da5a9dda520808dda"
  _type = "robot_control/WristCoordinates"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """Vector3 world_coordinate
Vector3 world_coordinate_l
Vector3 from_origin_coordinate

================================================================================
MSG: robot_control/Vector3
float64 x
float64 y
float64 z
"""
  __slots__ = ['world_coordinate','world_coordinate_l','from_origin_coordinate']
  _slot_types = ['robot_control/Vector3','robot_control/Vector3','robot_control/Vector3']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       world_coordinate,world_coordinate_l,from_origin_coordinate

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(WristCoordinates, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.world_coordinate is None:
        self.world_coordinate = robot_control.msg.Vector3()
      if self.world_coordinate_l is None:
        self.world_coordinate_l = robot_control.msg.Vector3()
      if self.from_origin_coordinate is None:
        self.from_origin_coordinate = robot_control.msg.Vector3()
    else:
      self.world_coordinate = robot_control.msg.Vector3()
      self.world_coordinate_l = robot_control.msg.Vector3()
      self.from_origin_coordinate = robot_control.msg.Vector3()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_9d().pack(_x.world_coordinate.x, _x.world_coordinate.y, _x.world_coordinate.z, _x.world_coordinate_l.x, _x.world_coordinate_l.y, _x.world_coordinate_l.z, _x.from_origin_coordinate.x, _x.from_origin_coordinate.y, _x.from_origin_coordinate.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.world_coordinate is None:
        self.world_coordinate = robot_control.msg.Vector3()
      if self.world_coordinate_l is None:
        self.world_coordinate_l = robot_control.msg.Vector3()
      if self.from_origin_coordinate is None:
        self.from_origin_coordinate = robot_control.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 72
      (_x.world_coordinate.x, _x.world_coordinate.y, _x.world_coordinate.z, _x.world_coordinate_l.x, _x.world_coordinate_l.y, _x.world_coordinate_l.z, _x.from_origin_coordinate.x, _x.from_origin_coordinate.y, _x.from_origin_coordinate.z,) = _get_struct_9d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_9d().pack(_x.world_coordinate.x, _x.world_coordinate.y, _x.world_coordinate.z, _x.world_coordinate_l.x, _x.world_coordinate_l.y, _x.world_coordinate_l.z, _x.from_origin_coordinate.x, _x.from_origin_coordinate.y, _x.from_origin_coordinate.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.world_coordinate is None:
        self.world_coordinate = robot_control.msg.Vector3()
      if self.world_coordinate_l is None:
        self.world_coordinate_l = robot_control.msg.Vector3()
      if self.from_origin_coordinate is None:
        self.from_origin_coordinate = robot_control.msg.Vector3()
      end = 0
      _x = self
      start = end
      end += 72
      (_x.world_coordinate.x, _x.world_coordinate.y, _x.world_coordinate.z, _x.world_coordinate_l.x, _x.world_coordinate_l.y, _x.world_coordinate_l.z, _x.from_origin_coordinate.x, _x.from_origin_coordinate.y, _x.from_origin_coordinate.z,) = _get_struct_9d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_9d = None
def _get_struct_9d():
    global _struct_9d
    if _struct_9d is None:
        _struct_9d = struct.Struct("<9d")
    return _struct_9d
