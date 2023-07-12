;; Auto-generated. Do not edit!


(when (boundp 'robot_control::GuiCmd)
  (if (not (find-package "ROBOT_CONTROL"))
    (make-package "ROBOT_CONTROL"))
  (shadow 'GuiCmd (find-package "ROBOT_CONTROL")))
(unless (find-package "ROBOT_CONTROL::GUICMD")
  (make-package "ROBOT_CONTROL::GUICMD"))

(in-package "ROS")
;;//! \htmlinclude GuiCmd.msg.html


(defclass robot_control::GuiCmd
  :super ros::object
  :slots (_cmd _shape _shape_mod _obj _args ))

(defmethod robot_control::GuiCmd
  (:init
   (&key
    ((:cmd __cmd) "")
    ((:shape __shape) "")
    ((:shape_mod __shape_mod) "")
    ((:obj __obj) "")
    ((:args __args) "")
    )
   (send-super :init)
   (setq _cmd (string __cmd))
   (setq _shape (string __shape))
   (setq _shape_mod (string __shape_mod))
   (setq _obj (string __obj))
   (setq _args (string __args))
   self)
  (:cmd
   (&optional __cmd)
   (if __cmd (setq _cmd __cmd)) _cmd)
  (:shape
   (&optional __shape)
   (if __shape (setq _shape __shape)) _shape)
  (:shape_mod
   (&optional __shape_mod)
   (if __shape_mod (setq _shape_mod __shape_mod)) _shape_mod)
  (:obj
   (&optional __obj)
   (if __obj (setq _obj __obj)) _obj)
  (:args
   (&optional __args)
   (if __args (setq _args __args)) _args)
  (:serialization-length
   ()
   (+
    ;; string _cmd
    4 (length _cmd)
    ;; string _shape
    4 (length _shape)
    ;; string _shape_mod
    4 (length _shape_mod)
    ;; string _obj
    4 (length _obj)
    ;; string _args
    4 (length _args)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _cmd
       (write-long (length _cmd) s) (princ _cmd s)
     ;; string _shape
       (write-long (length _shape) s) (princ _shape s)
     ;; string _shape_mod
       (write-long (length _shape_mod) s) (princ _shape_mod s)
     ;; string _obj
       (write-long (length _obj) s) (princ _obj s)
     ;; string _args
       (write-long (length _args) s) (princ _args s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _shape
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _shape (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _shape_mod
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _shape_mod (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _obj
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _obj (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _args
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _args (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get robot_control::GuiCmd :md5sum-) "ebea78b44dfee6d2c22e443dcfe0f057")
(setf (get robot_control::GuiCmd :datatype-) "robot_control/GuiCmd")
(setf (get robot_control::GuiCmd :definition-)
      "string cmd 
string shape
string shape_mod
string obj
string args

")



(provide :robot_control/GuiCmd "ebea78b44dfee6d2c22e443dcfe0f057")


