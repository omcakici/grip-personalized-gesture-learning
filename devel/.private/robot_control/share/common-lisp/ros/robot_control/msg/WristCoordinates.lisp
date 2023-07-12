; Auto-generated. Do not edit!


(cl:in-package robot_control-msg)


;//! \htmlinclude WristCoordinates.msg.html

(cl:defclass <WristCoordinates> (roslisp-msg-protocol:ros-message)
  ((world_coordinate
    :reader world_coordinate
    :initarg :world_coordinate
    :type robot_control-msg:Vector3
    :initform (cl:make-instance 'robot_control-msg:Vector3))
   (world_coordinate_l
    :reader world_coordinate_l
    :initarg :world_coordinate_l
    :type robot_control-msg:Vector3
    :initform (cl:make-instance 'robot_control-msg:Vector3))
   (from_origin_coordinate
    :reader from_origin_coordinate
    :initarg :from_origin_coordinate
    :type robot_control-msg:Vector3
    :initform (cl:make-instance 'robot_control-msg:Vector3)))
)

(cl:defclass WristCoordinates (<WristCoordinates>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WristCoordinates>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WristCoordinates)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_control-msg:<WristCoordinates> is deprecated: use robot_control-msg:WristCoordinates instead.")))

(cl:ensure-generic-function 'world_coordinate-val :lambda-list '(m))
(cl:defmethod world_coordinate-val ((m <WristCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:world_coordinate-val is deprecated.  Use robot_control-msg:world_coordinate instead.")
  (world_coordinate m))

(cl:ensure-generic-function 'world_coordinate_l-val :lambda-list '(m))
(cl:defmethod world_coordinate_l-val ((m <WristCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:world_coordinate_l-val is deprecated.  Use robot_control-msg:world_coordinate_l instead.")
  (world_coordinate_l m))

(cl:ensure-generic-function 'from_origin_coordinate-val :lambda-list '(m))
(cl:defmethod from_origin_coordinate-val ((m <WristCoordinates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:from_origin_coordinate-val is deprecated.  Use robot_control-msg:from_origin_coordinate instead.")
  (from_origin_coordinate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WristCoordinates>) ostream)
  "Serializes a message object of type '<WristCoordinates>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'world_coordinate) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'world_coordinate_l) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'from_origin_coordinate) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WristCoordinates>) istream)
  "Deserializes a message object of type '<WristCoordinates>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'world_coordinate) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'world_coordinate_l) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'from_origin_coordinate) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WristCoordinates>)))
  "Returns string type for a message object of type '<WristCoordinates>"
  "robot_control/WristCoordinates")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WristCoordinates)))
  "Returns string type for a message object of type 'WristCoordinates"
  "robot_control/WristCoordinates")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WristCoordinates>)))
  "Returns md5sum for a message object of type '<WristCoordinates>"
  "5df8eb49232da68da5a9dda520808dda")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WristCoordinates)))
  "Returns md5sum for a message object of type 'WristCoordinates"
  "5df8eb49232da68da5a9dda520808dda")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WristCoordinates>)))
  "Returns full string definition for message of type '<WristCoordinates>"
  (cl:format cl:nil "Vector3 world_coordinate~%Vector3 world_coordinate_l~%Vector3 from_origin_coordinate~%~%================================================================================~%MSG: robot_control/Vector3~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WristCoordinates)))
  "Returns full string definition for message of type 'WristCoordinates"
  (cl:format cl:nil "Vector3 world_coordinate~%Vector3 world_coordinate_l~%Vector3 from_origin_coordinate~%~%================================================================================~%MSG: robot_control/Vector3~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WristCoordinates>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'world_coordinate))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'world_coordinate_l))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'from_origin_coordinate))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WristCoordinates>))
  "Converts a ROS message object to a list"
  (cl:list 'WristCoordinates
    (cl:cons ':world_coordinate (world_coordinate msg))
    (cl:cons ':world_coordinate_l (world_coordinate_l msg))
    (cl:cons ':from_origin_coordinate (from_origin_coordinate msg))
))
