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

class GuiCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cmd = null;
      this.shape = null;
      this.shape_mod = null;
      this.obj = null;
      this.args = null;
    }
    else {
      if (initObj.hasOwnProperty('cmd')) {
        this.cmd = initObj.cmd
      }
      else {
        this.cmd = '';
      }
      if (initObj.hasOwnProperty('shape')) {
        this.shape = initObj.shape
      }
      else {
        this.shape = '';
      }
      if (initObj.hasOwnProperty('shape_mod')) {
        this.shape_mod = initObj.shape_mod
      }
      else {
        this.shape_mod = '';
      }
      if (initObj.hasOwnProperty('obj')) {
        this.obj = initObj.obj
      }
      else {
        this.obj = '';
      }
      if (initObj.hasOwnProperty('args')) {
        this.args = initObj.args
      }
      else {
        this.args = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GuiCmd
    // Serialize message field [cmd]
    bufferOffset = _serializer.string(obj.cmd, buffer, bufferOffset);
    // Serialize message field [shape]
    bufferOffset = _serializer.string(obj.shape, buffer, bufferOffset);
    // Serialize message field [shape_mod]
    bufferOffset = _serializer.string(obj.shape_mod, buffer, bufferOffset);
    // Serialize message field [obj]
    bufferOffset = _serializer.string(obj.obj, buffer, bufferOffset);
    // Serialize message field [args]
    bufferOffset = _serializer.string(obj.args, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GuiCmd
    let len;
    let data = new GuiCmd(null);
    // Deserialize message field [cmd]
    data.cmd = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [shape]
    data.shape = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [shape_mod]
    data.shape_mod = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [obj]
    data.obj = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [args]
    data.args = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.cmd);
    length += _getByteLength(object.shape);
    length += _getByteLength(object.shape_mod);
    length += _getByteLength(object.obj);
    length += _getByteLength(object.args);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robot_control/GuiCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ebea78b44dfee6d2c22e443dcfe0f057';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string cmd 
    string shape
    string shape_mod
    string obj
    string args
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GuiCmd(null);
    if (msg.cmd !== undefined) {
      resolved.cmd = msg.cmd;
    }
    else {
      resolved.cmd = ''
    }

    if (msg.shape !== undefined) {
      resolved.shape = msg.shape;
    }
    else {
      resolved.shape = ''
    }

    if (msg.shape_mod !== undefined) {
      resolved.shape_mod = msg.shape_mod;
    }
    else {
      resolved.shape_mod = ''
    }

    if (msg.obj !== undefined) {
      resolved.obj = msg.obj;
    }
    else {
      resolved.obj = ''
    }

    if (msg.args !== undefined) {
      resolved.args = msg.args;
    }
    else {
      resolved.args = ''
    }

    return resolved;
    }
};

module.exports = GuiCmd;
