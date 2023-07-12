// Auto-generated. Do not edit!

// (in-package robot_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class BotState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode_changed = null;
      this.sign_mode_changed = null;
      this.test_started = null;
      this.depth_fixed = null;
      this.record_init = null;
      this.mode_name = null;
      this.sign_mode_name = null;
      this.subject_name = null;
      this.simulator_name = null;
      this.test_shape = null;
      this.depth = null;
      this.max_angle = null;
      this.latest_rmse = null;
      this.info = null;
    }
    else {
      if (initObj.hasOwnProperty('mode_changed')) {
        this.mode_changed = initObj.mode_changed
      }
      else {
        this.mode_changed = false;
      }
      if (initObj.hasOwnProperty('sign_mode_changed')) {
        this.sign_mode_changed = initObj.sign_mode_changed
      }
      else {
        this.sign_mode_changed = false;
      }
      if (initObj.hasOwnProperty('test_started')) {
        this.test_started = initObj.test_started
      }
      else {
        this.test_started = false;
      }
      if (initObj.hasOwnProperty('depth_fixed')) {
        this.depth_fixed = initObj.depth_fixed
      }
      else {
        this.depth_fixed = false;
      }
      if (initObj.hasOwnProperty('record_init')) {
        this.record_init = initObj.record_init
      }
      else {
        this.record_init = false;
      }
      if (initObj.hasOwnProperty('mode_name')) {
        this.mode_name = initObj.mode_name
      }
      else {
        this.mode_name = '';
      }
      if (initObj.hasOwnProperty('sign_mode_name')) {
        this.sign_mode_name = initObj.sign_mode_name
      }
      else {
        this.sign_mode_name = '';
      }
      if (initObj.hasOwnProperty('subject_name')) {
        this.subject_name = initObj.subject_name
      }
      else {
        this.subject_name = '';
      }
      if (initObj.hasOwnProperty('simulator_name')) {
        this.simulator_name = initObj.simulator_name
      }
      else {
        this.simulator_name = '';
      }
      if (initObj.hasOwnProperty('test_shape')) {
        this.test_shape = initObj.test_shape
      }
      else {
        this.test_shape = '';
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = 0.0;
      }
      if (initObj.hasOwnProperty('max_angle')) {
        this.max_angle = initObj.max_angle
      }
      else {
        this.max_angle = 0.0;
      }
      if (initObj.hasOwnProperty('latest_rmse')) {
        this.latest_rmse = initObj.latest_rmse
      }
      else {
        this.latest_rmse = 0.0;
      }
      if (initObj.hasOwnProperty('info')) {
        this.info = initObj.info
      }
      else {
        this.info = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BotState
    // Serialize message field [mode_changed]
    bufferOffset = _serializer.bool(obj.mode_changed, buffer, bufferOffset);
    // Serialize message field [sign_mode_changed]
    bufferOffset = _serializer.bool(obj.sign_mode_changed, buffer, bufferOffset);
    // Serialize message field [test_started]
    bufferOffset = _serializer.bool(obj.test_started, buffer, bufferOffset);
    // Serialize message field [depth_fixed]
    bufferOffset = _serializer.bool(obj.depth_fixed, buffer, bufferOffset);
    // Serialize message field [record_init]
    bufferOffset = _serializer.bool(obj.record_init, buffer, bufferOffset);
    // Serialize message field [mode_name]
    bufferOffset = _serializer.string(obj.mode_name, buffer, bufferOffset);
    // Serialize message field [sign_mode_name]
    bufferOffset = _serializer.string(obj.sign_mode_name, buffer, bufferOffset);
    // Serialize message field [subject_name]
    bufferOffset = _serializer.string(obj.subject_name, buffer, bufferOffset);
    // Serialize message field [simulator_name]
    bufferOffset = _serializer.string(obj.simulator_name, buffer, bufferOffset);
    // Serialize message field [test_shape]
    bufferOffset = _serializer.string(obj.test_shape, buffer, bufferOffset);
    // Serialize message field [depth]
    bufferOffset = _serializer.float32(obj.depth, buffer, bufferOffset);
    // Serialize message field [max_angle]
    bufferOffset = _serializer.float32(obj.max_angle, buffer, bufferOffset);
    // Serialize message field [latest_rmse]
    bufferOffset = _serializer.float32(obj.latest_rmse, buffer, bufferOffset);
    // Serialize message field [info]
    bufferOffset = _serializer.string(obj.info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BotState
    let len;
    let data = new BotState(null);
    // Deserialize message field [mode_changed]
    data.mode_changed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sign_mode_changed]
    data.sign_mode_changed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [test_started]
    data.test_started = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [depth_fixed]
    data.depth_fixed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [record_init]
    data.record_init = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [mode_name]
    data.mode_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sign_mode_name]
    data.sign_mode_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [subject_name]
    data.subject_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [simulator_name]
    data.simulator_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [test_shape]
    data.test_shape = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [depth]
    data.depth = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_angle]
    data.max_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [latest_rmse]
    data.latest_rmse = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [info]
    data.info = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.mode_name);
    length += _getByteLength(object.sign_mode_name);
    length += _getByteLength(object.subject_name);
    length += _getByteLength(object.simulator_name);
    length += _getByteLength(object.test_shape);
    length += _getByteLength(object.info);
    return length + 41;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_control/BotState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c4f0cdb28a766b1ae745e458f106a17';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool mode_changed
    bool sign_mode_changed
    bool test_started
    bool depth_fixed
    bool record_init
    string mode_name 
    string sign_mode_name
    string subject_name
    string simulator_name
    string test_shape
    float32 depth
    float32 max_angle
    float32 latest_rmse
    string info
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BotState(null);
    if (msg.mode_changed !== undefined) {
      resolved.mode_changed = msg.mode_changed;
    }
    else {
      resolved.mode_changed = false
    }

    if (msg.sign_mode_changed !== undefined) {
      resolved.sign_mode_changed = msg.sign_mode_changed;
    }
    else {
      resolved.sign_mode_changed = false
    }

    if (msg.test_started !== undefined) {
      resolved.test_started = msg.test_started;
    }
    else {
      resolved.test_started = false
    }

    if (msg.depth_fixed !== undefined) {
      resolved.depth_fixed = msg.depth_fixed;
    }
    else {
      resolved.depth_fixed = false
    }

    if (msg.record_init !== undefined) {
      resolved.record_init = msg.record_init;
    }
    else {
      resolved.record_init = false
    }

    if (msg.mode_name !== undefined) {
      resolved.mode_name = msg.mode_name;
    }
    else {
      resolved.mode_name = ''
    }

    if (msg.sign_mode_name !== undefined) {
      resolved.sign_mode_name = msg.sign_mode_name;
    }
    else {
      resolved.sign_mode_name = ''
    }

    if (msg.subject_name !== undefined) {
      resolved.subject_name = msg.subject_name;
    }
    else {
      resolved.subject_name = ''
    }

    if (msg.simulator_name !== undefined) {
      resolved.simulator_name = msg.simulator_name;
    }
    else {
      resolved.simulator_name = ''
    }

    if (msg.test_shape !== undefined) {
      resolved.test_shape = msg.test_shape;
    }
    else {
      resolved.test_shape = ''
    }

    if (msg.depth !== undefined) {
      resolved.depth = msg.depth;
    }
    else {
      resolved.depth = 0.0
    }

    if (msg.max_angle !== undefined) {
      resolved.max_angle = msg.max_angle;
    }
    else {
      resolved.max_angle = 0.0
    }

    if (msg.latest_rmse !== undefined) {
      resolved.latest_rmse = msg.latest_rmse;
    }
    else {
      resolved.latest_rmse = 0.0
    }

    if (msg.info !== undefined) {
      resolved.info = msg.info;
    }
    else {
      resolved.info = ''
    }

    return resolved;
    }
};

module.exports = BotState;
