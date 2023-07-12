; Auto-generated. Do not edit!


(cl:in-package robot_control-msg)


;//! \htmlinclude BotState.msg.html

(cl:defclass <BotState> (roslisp-msg-protocol:ros-message)
  ((mode_changed
    :reader mode_changed
    :initarg :mode_changed
    :type cl:boolean
    :initform cl:nil)
   (sign_mode_changed
    :reader sign_mode_changed
    :initarg :sign_mode_changed
    :type cl:boolean
    :initform cl:nil)
   (test_started
    :reader test_started
    :initarg :test_started
    :type cl:boolean
    :initform cl:nil)
   (depth_fixed
    :reader depth_fixed
    :initarg :depth_fixed
    :type cl:boolean
    :initform cl:nil)
   (record_init
    :reader record_init
    :initarg :record_init
    :type cl:boolean
    :initform cl:nil)
   (mode_name
    :reader mode_name
    :initarg :mode_name
    :type cl:string
    :initform "")
   (sign_mode_name
    :reader sign_mode_name
    :initarg :sign_mode_name
    :type cl:string
    :initform "")
   (subject_name
    :reader subject_name
    :initarg :subject_name
    :type cl:string
    :initform "")
   (simulator_name
    :reader simulator_name
    :initarg :simulator_name
    :type cl:string
    :initform "")
   (test_shape
    :reader test_shape
    :initarg :test_shape
    :type cl:string
    :initform "")
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0)
   (max_angle
    :reader max_angle
    :initarg :max_angle
    :type cl:float
    :initform 0.0)
   (latest_rmse
    :reader latest_rmse
    :initarg :latest_rmse
    :type cl:float
    :initform 0.0)
   (info
    :reader info
    :initarg :info
    :type cl:string
    :initform ""))
)

(cl:defclass BotState (<BotState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BotState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BotState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_control-msg:<BotState> is deprecated: use robot_control-msg:BotState instead.")))

(cl:ensure-generic-function 'mode_changed-val :lambda-list '(m))
(cl:defmethod mode_changed-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:mode_changed-val is deprecated.  Use robot_control-msg:mode_changed instead.")
  (mode_changed m))

(cl:ensure-generic-function 'sign_mode_changed-val :lambda-list '(m))
(cl:defmethod sign_mode_changed-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:sign_mode_changed-val is deprecated.  Use robot_control-msg:sign_mode_changed instead.")
  (sign_mode_changed m))

(cl:ensure-generic-function 'test_started-val :lambda-list '(m))
(cl:defmethod test_started-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:test_started-val is deprecated.  Use robot_control-msg:test_started instead.")
  (test_started m))

(cl:ensure-generic-function 'depth_fixed-val :lambda-list '(m))
(cl:defmethod depth_fixed-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:depth_fixed-val is deprecated.  Use robot_control-msg:depth_fixed instead.")
  (depth_fixed m))

(cl:ensure-generic-function 'record_init-val :lambda-list '(m))
(cl:defmethod record_init-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:record_init-val is deprecated.  Use robot_control-msg:record_init instead.")
  (record_init m))

(cl:ensure-generic-function 'mode_name-val :lambda-list '(m))
(cl:defmethod mode_name-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:mode_name-val is deprecated.  Use robot_control-msg:mode_name instead.")
  (mode_name m))

(cl:ensure-generic-function 'sign_mode_name-val :lambda-list '(m))
(cl:defmethod sign_mode_name-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:sign_mode_name-val is deprecated.  Use robot_control-msg:sign_mode_name instead.")
  (sign_mode_name m))

(cl:ensure-generic-function 'subject_name-val :lambda-list '(m))
(cl:defmethod subject_name-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:subject_name-val is deprecated.  Use robot_control-msg:subject_name instead.")
  (subject_name m))

(cl:ensure-generic-function 'simulator_name-val :lambda-list '(m))
(cl:defmethod simulator_name-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:simulator_name-val is deprecated.  Use robot_control-msg:simulator_name instead.")
  (simulator_name m))

(cl:ensure-generic-function 'test_shape-val :lambda-list '(m))
(cl:defmethod test_shape-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:test_shape-val is deprecated.  Use robot_control-msg:test_shape instead.")
  (test_shape m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:depth-val is deprecated.  Use robot_control-msg:depth instead.")
  (depth m))

(cl:ensure-generic-function 'max_angle-val :lambda-list '(m))
(cl:defmethod max_angle-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:max_angle-val is deprecated.  Use robot_control-msg:max_angle instead.")
  (max_angle m))

(cl:ensure-generic-function 'latest_rmse-val :lambda-list '(m))
(cl:defmethod latest_rmse-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:latest_rmse-val is deprecated.  Use robot_control-msg:latest_rmse instead.")
  (latest_rmse m))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <BotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-msg:info-val is deprecated.  Use robot_control-msg:info instead.")
  (info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BotState>) ostream)
  "Serializes a message object of type '<BotState>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'mode_changed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sign_mode_changed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'test_started) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'depth_fixed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'record_init) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sign_mode_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sign_mode_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'subject_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'subject_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'simulator_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'simulator_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'test_shape))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'test_shape))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'latest_rmse))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'info))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'info))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BotState>) istream)
  "Deserializes a message object of type '<BotState>"
    (cl:setf (cl:slot-value msg 'mode_changed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'sign_mode_changed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'test_started) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'depth_fixed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'record_init) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sign_mode_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sign_mode_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'subject_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'subject_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'simulator_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'simulator_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'test_shape) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'test_shape) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latest_rmse) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'info) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'info) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BotState>)))
  "Returns string type for a message object of type '<BotState>"
  "robot_control/BotState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BotState)))
  "Returns string type for a message object of type 'BotState"
  "robot_control/BotState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BotState>)))
  "Returns md5sum for a message object of type '<BotState>"
  "7c4f0cdb28a766b1ae745e458f106a17")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BotState)))
  "Returns md5sum for a message object of type 'BotState"
  "7c4f0cdb28a766b1ae745e458f106a17")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BotState>)))
  "Returns full string definition for message of type '<BotState>"
  (cl:format cl:nil "bool mode_changed~%bool sign_mode_changed~%bool test_started~%bool depth_fixed~%bool record_init~%string mode_name ~%string sign_mode_name~%string subject_name~%string simulator_name~%string test_shape~%float32 depth~%float32 max_angle~%float32 latest_rmse~%string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BotState)))
  "Returns full string definition for message of type 'BotState"
  (cl:format cl:nil "bool mode_changed~%bool sign_mode_changed~%bool test_started~%bool depth_fixed~%bool record_init~%string mode_name ~%string sign_mode_name~%string subject_name~%string simulator_name~%string test_shape~%float32 depth~%float32 max_angle~%float32 latest_rmse~%string info~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BotState>))
  (cl:+ 0
     1
     1
     1
     1
     1
     4 (cl:length (cl:slot-value msg 'mode_name))
     4 (cl:length (cl:slot-value msg 'sign_mode_name))
     4 (cl:length (cl:slot-value msg 'subject_name))
     4 (cl:length (cl:slot-value msg 'simulator_name))
     4 (cl:length (cl:slot-value msg 'test_shape))
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BotState>))
  "Converts a ROS message object to a list"
  (cl:list 'BotState
    (cl:cons ':mode_changed (mode_changed msg))
    (cl:cons ':sign_mode_changed (sign_mode_changed msg))
    (cl:cons ':test_started (test_started msg))
    (cl:cons ':depth_fixed (depth_fixed msg))
    (cl:cons ':record_init (record_init msg))
    (cl:cons ':mode_name (mode_name msg))
    (cl:cons ':sign_mode_name (sign_mode_name msg))
    (cl:cons ':subject_name (subject_name msg))
    (cl:cons ':simulator_name (simulator_name msg))
    (cl:cons ':test_shape (test_shape msg))
    (cl:cons ':depth (depth msg))
    (cl:cons ':max_angle (max_angle msg))
    (cl:cons ':latest_rmse (latest_rmse msg))
    (cl:cons ':info (info msg))
))
