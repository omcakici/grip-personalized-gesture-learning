;; Auto-generated. Do not edit!


(when (boundp 'robot_control::BotState)
  (if (not (find-package "ROBOT_CONTROL"))
    (make-package "ROBOT_CONTROL"))
  (shadow 'BotState (find-package "ROBOT_CONTROL")))
(unless (find-package "ROBOT_CONTROL::BOTSTATE")
  (make-package "ROBOT_CONTROL::BOTSTATE"))

(in-package "ROS")
;;//! \htmlinclude BotState.msg.html


(defclass robot_control::BotState
  :super ros::object
  :slots (_mode_changed _sign_mode_changed _test_started _depth_fixed _record_init _mode_name _sign_mode_name _subject_name _simulator_name _test_shape _depth _max_angle _latest_rmse _info ))

(defmethod robot_control::BotState
  (:init
   (&key
    ((:mode_changed __mode_changed) nil)
    ((:sign_mode_changed __sign_mode_changed) nil)
    ((:test_started __test_started) nil)
    ((:depth_fixed __depth_fixed) nil)
    ((:record_init __record_init) nil)
    ((:mode_name __mode_name) "")
    ((:sign_mode_name __sign_mode_name) "")
    ((:subject_name __subject_name) "")
    ((:simulator_name __simulator_name) "")
    ((:test_shape __test_shape) "")
    ((:depth __depth) 0.0)
    ((:max_angle __max_angle) 0.0)
    ((:latest_rmse __latest_rmse) 0.0)
    ((:info __info) "")
    )
   (send-super :init)
   (setq _mode_changed __mode_changed)
   (setq _sign_mode_changed __sign_mode_changed)
   (setq _test_started __test_started)
   (setq _depth_fixed __depth_fixed)
   (setq _record_init __record_init)
   (setq _mode_name (string __mode_name))
   (setq _sign_mode_name (string __sign_mode_name))
   (setq _subject_name (string __subject_name))
   (setq _simulator_name (string __simulator_name))
   (setq _test_shape (string __test_shape))
   (setq _depth (float __depth))
   (setq _max_angle (float __max_angle))
   (setq _latest_rmse (float __latest_rmse))
   (setq _info (string __info))
   self)
  (:mode_changed
   (&optional (__mode_changed :null))
   (if (not (eq __mode_changed :null)) (setq _mode_changed __mode_changed)) _mode_changed)
  (:sign_mode_changed
   (&optional (__sign_mode_changed :null))
   (if (not (eq __sign_mode_changed :null)) (setq _sign_mode_changed __sign_mode_changed)) _sign_mode_changed)
  (:test_started
   (&optional (__test_started :null))
   (if (not (eq __test_started :null)) (setq _test_started __test_started)) _test_started)
  (:depth_fixed
   (&optional (__depth_fixed :null))
   (if (not (eq __depth_fixed :null)) (setq _depth_fixed __depth_fixed)) _depth_fixed)
  (:record_init
   (&optional (__record_init :null))
   (if (not (eq __record_init :null)) (setq _record_init __record_init)) _record_init)
  (:mode_name
   (&optional __mode_name)
   (if __mode_name (setq _mode_name __mode_name)) _mode_name)
  (:sign_mode_name
   (&optional __sign_mode_name)
   (if __sign_mode_name (setq _sign_mode_name __sign_mode_name)) _sign_mode_name)
  (:subject_name
   (&optional __subject_name)
   (if __subject_name (setq _subject_name __subject_name)) _subject_name)
  (:simulator_name
   (&optional __simulator_name)
   (if __simulator_name (setq _simulator_name __simulator_name)) _simulator_name)
  (:test_shape
   (&optional __test_shape)
   (if __test_shape (setq _test_shape __test_shape)) _test_shape)
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:max_angle
   (&optional __max_angle)
   (if __max_angle (setq _max_angle __max_angle)) _max_angle)
  (:latest_rmse
   (&optional __latest_rmse)
   (if __latest_rmse (setq _latest_rmse __latest_rmse)) _latest_rmse)
  (:info
   (&optional __info)
   (if __info (setq _info __info)) _info)
  (:serialization-length
   ()
   (+
    ;; bool _mode_changed
    1
    ;; bool _sign_mode_changed
    1
    ;; bool _test_started
    1
    ;; bool _depth_fixed
    1
    ;; bool _record_init
    1
    ;; string _mode_name
    4 (length _mode_name)
    ;; string _sign_mode_name
    4 (length _sign_mode_name)
    ;; string _subject_name
    4 (length _subject_name)
    ;; string _simulator_name
    4 (length _simulator_name)
    ;; string _test_shape
    4 (length _test_shape)
    ;; float32 _depth
    4
    ;; float32 _max_angle
    4
    ;; float32 _latest_rmse
    4
    ;; string _info
    4 (length _info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _mode_changed
       (if _mode_changed (write-byte -1 s) (write-byte 0 s))
     ;; bool _sign_mode_changed
       (if _sign_mode_changed (write-byte -1 s) (write-byte 0 s))
     ;; bool _test_started
       (if _test_started (write-byte -1 s) (write-byte 0 s))
     ;; bool _depth_fixed
       (if _depth_fixed (write-byte -1 s) (write-byte 0 s))
     ;; bool _record_init
       (if _record_init (write-byte -1 s) (write-byte 0 s))
     ;; string _mode_name
       (write-long (length _mode_name) s) (princ _mode_name s)
     ;; string _sign_mode_name
       (write-long (length _sign_mode_name) s) (princ _sign_mode_name s)
     ;; string _subject_name
       (write-long (length _subject_name) s) (princ _subject_name s)
     ;; string _simulator_name
       (write-long (length _simulator_name) s) (princ _simulator_name s)
     ;; string _test_shape
       (write-long (length _test_shape) s) (princ _test_shape s)
     ;; float32 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_angle
       (sys::poke _max_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _latest_rmse
       (sys::poke _latest_rmse (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _info
       (write-long (length _info) s) (princ _info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _mode_changed
     (setq _mode_changed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _sign_mode_changed
     (setq _sign_mode_changed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _test_started
     (setq _test_started (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _depth_fixed
     (setq _depth_fixed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _record_init
     (setq _record_init (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _mode_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _sign_mode_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sign_mode_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _subject_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _subject_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _simulator_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _simulator_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _test_shape
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _test_shape (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _depth
     (setq _depth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_angle
     (setq _max_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _latest_rmse
     (setq _latest_rmse (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robot_control::BotState :md5sum-) "7c4f0cdb28a766b1ae745e458f106a17")
(setf (get robot_control::BotState :datatype-) "robot_control/BotState")
(setf (get robot_control::BotState :definition-)
      "bool mode_changed
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

")



(provide :robot_control/BotState "7c4f0cdb28a766b1ae745e458f106a17")


