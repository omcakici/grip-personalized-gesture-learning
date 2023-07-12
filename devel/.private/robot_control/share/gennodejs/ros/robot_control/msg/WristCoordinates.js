// Auto-generated. Do not edit!

// (in-package robot_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Vector3 = require('./Vector3.js');

//-----------------------------------------------------------

class WristCoordinates {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.world_coordinate = null;
      this.world_coordinate_l = null;
      this.from_origin_coordinate = null;
    }
    else {
      if (initObj.hasOwnProperty('world_coordinate')) {
        this.world_coordinate = initObj.world_coordinate
      }
      else {
        this.world_coordinate = new Vector3();
      }
      if (initObj.hasOwnProperty('world_coordinate_l')) {
        this.world_coordinate_l = initObj.world_coordinate_l
      }
      else {
        this.world_coordinate_l = new Vector3();
      }
      if (initObj.hasOwnProperty('from_origin_coordinate')) {
        this.from_origin_coordinate = initObj.from_origin_coordinate
      }
      else {
        this.from_origin_coordinate = new Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WristCoordinates
    // Serialize message field [world_coordinate]
    bufferOffset = Vector3.serialize(obj.world_coordinate, buffer, bufferOffset);
    // Serialize message field [world_coordinate_l]
    bufferOffset = Vector3.serialize(obj.world_coordinate_l, buffer, bufferOffset);
    // Serialize message field [from_origin_coordinate]
    bufferOffset = Vector3.serialize(obj.from_origin_coordinate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WristCoordinates
    let len;
    let data = new WristCoordinates(null);
    // Deserialize message field [world_coordinate]
    data.world_coordinate = Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [world_coordinate_l]
    data.world_coordinate_l = Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [from_origin_coordinate]
    data.from_origin_coordinate = Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 72;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_control/WristCoordinates';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5df8eb49232da68da5a9dda520808dda';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Vector3 world_coordinate
    Vector3 world_coordinate_l
    Vector3 from_origin_coordinate
    
    ================================================================================
    MSG: robot_control/Vector3
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WristCoordinates(null);
    if (msg.world_coordinate !== undefined) {
      resolved.world_coordinate = Vector3.Resolve(msg.world_coordinate)
    }
    else {
      resolved.world_coordinate = new Vector3()
    }

    if (msg.world_coordinate_l !== undefined) {
      resolved.world_coordinate_l = Vector3.Resolve(msg.world_coordinate_l)
    }
    else {
      resolved.world_coordinate_l = new Vector3()
    }

    if (msg.from_origin_coordinate !== undefined) {
      resolved.from_origin_coordinate = Vector3.Resolve(msg.from_origin_coordinate)
    }
    else {
      resolved.from_origin_coordinate = new Vector3()
    }

    return resolved;
    }
};

module.exports = WristCoordinates;
