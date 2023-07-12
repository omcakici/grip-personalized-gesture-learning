;; Auto-generated. Do not edit!


(when (boundp 'robot_control::WristCoordinates)
  (if (not (find-package "ROBOT_CONTROL"))
    (make-package "ROBOT_CONTROL"))
  (shadow 'WristCoordinates (find-package "ROBOT_CONTROL")))
(unless (find-package "ROBOT_CONTROL::WRISTCOORDINATES")
  (make-package "ROBOT_CONTROL::WRISTCOORDINATES"))

(in-package "ROS")
;;//! \htmlinclude WristCoordinates.msg.html


(defclass robot_control::WristCoordinates
  :super ros::object
  :slots (_world_coordinate _world_coordinate_l _from_origin_coordinate ))

(defmethod robot_control::WristCoordinates
  (:init
   (&key
    ((:world_coordinate __world_coordinate) (instance robot_control::Vector3 :init))
    ((:world_coordinate_l __world_coordinate_l) (instance robot_control::Vector3 :init))
    ((:from_origin_coordinate __from_origin_coordinate) (instance robot_control::Vector3 :init))
    )
   (send-super :init)
   (setq _world_coordinate __world_coordinate)
   (setq _world_coordinate_l __world_coordinate_l)
   (setq _from_origin_coordinate __from_origin_coordinate)
   self)
  (:world_coordinate
   (&rest __world_coordinate)
   (if (keywordp (car __world_coordinate))
       (send* _world_coordinate __world_coordinate)
     (progn
       (if __world_coordinate (setq _world_coordinate (car __world_coordinate)))
       _world_coordinate)))
  (:world_coordinate_l
   (&rest __world_coordinate_l)
   (if (keywordp (car __world_coordinate_l))
       (send* _world_coordinate_l __world_coordinate_l)
     (progn
       (if __world_coordinate_l (setq _world_coordinate_l (car __world_coordinate_l)))
       _world_coordinate_l)))
  (:from_origin_coordinate
   (&rest __from_origin_coordinate)
   (if (keywordp (car __from_origin_coordinate))
       (send* _from_origin_coordinate __from_origin_coordinate)
     (progn
       (if __from_origin_coordinate (setq _from_origin_coordinate (car __from_origin_coordinate)))
       _from_origin_coordinate)))
  (:serialization-length
   ()
   (+
    ;; robot_control/Vector3 _world_coordinate
    (send _world_coordinate :serialization-length)
    ;; robot_control/Vector3 _world_coordinate_l
    (send _world_coordinate_l :serialization-length)
    ;; robot_control/Vector3 _from_origin_coordinate
    (send _from_origin_coordinate :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robot_control/Vector3 _world_coordinate
       (send _world_coordinate :serialize s)
     ;; robot_control/Vector3 _world_coordinate_l
       (send _world_coordinate_l :serialize s)
     ;; robot_control/Vector3 _from_origin_coordinate
       (send _from_origin_coordinate :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robot_control/Vector3 _world_coordinate
     (send _world_coordinate :deserialize buf ptr-) (incf ptr- (send _world_coordinate :serialization-length))
   ;; robot_control/Vector3 _world_coordinate_l
     (send _world_coordinate_l :deserialize buf ptr-) (incf ptr- (send _world_coordinate_l :serialization-length))
   ;; robot_control/Vector3 _from_origin_coordinate
     (send _from_origin_coordinate :deserialize buf ptr-) (incf ptr- (send _from_origin_coordinate :serialization-length))
   ;;
   self)
  )

(setf (get robot_control::WristCoordinates :md5sum-) "5df8eb49232da68da5a9dda520808dda")
(setf (get robot_control::WristCoordinates :datatype-) "robot_control/WristCoordinates")
(setf (get robot_control::WristCoordinates :definition-)
      "Vector3 world_coordinate
Vector3 world_coordinate_l
Vector3 from_origin_coordinate

================================================================================
MSG: robot_control/Vector3
float64 x
float64 y
float64 z

")



(provide :robot_control/WristCoordinates "5df8eb49232da68da5a9dda520808dda")


