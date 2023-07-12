
(cl:in-package :asdf)

(defsystem "robot_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "BotState" :depends-on ("_package_BotState"))
    (:file "_package_BotState" :depends-on ("_package"))
    (:file "GuiCmd" :depends-on ("_package_GuiCmd"))
    (:file "_package_GuiCmd" :depends-on ("_package"))
    (:file "Vector3" :depends-on ("_package_Vector3"))
    (:file "_package_Vector3" :depends-on ("_package"))
    (:file "WristCoordinates" :depends-on ("_package_WristCoordinates"))
    (:file "_package_WristCoordinates" :depends-on ("_package"))
  ))