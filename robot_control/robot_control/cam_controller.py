#!/usr/bin/env python3

import sys
import rospy
from std_msgs.msg import String
from utils.cvutils import CvUtils

class CamController:
    sign_languages_published = 0

    def __init__(self, email=None):
        rospy.init_node('cam_controller')

        # If email is provided, pass it to CvUtils
        self.cvUtils = CvUtils(email) if email else CvUtils()
        
        self.publisher_signlang = rospy.Publisher(
            'sign_lang', String, queue_size=10)
        
        self.process_stream()

    def process_stream(self):
        stat = 0
        while not rospy.is_shutdown() and not stat:
            try:
                stat = self.cvUtils.process_stream()
                self.publish_signlang()
                rospy.sleep(0.0001)

            except KeyboardInterrupt:
                self.cvUtils.cv_shutdown()
                sys.exit()
        self.cvUtils.cv_shutdown()
        sys.exit()

    def publish_signlang(self):
        if self.cvUtils.sentence and self.cvUtils.sentence[-1] != 'nothing':
            if len(self.cvUtils.sentence) > self.sign_languages_published:
                msg = String()
                msg.data = self.cvUtils.sentence[-1]
                self.publisher_signlang.publish(msg)
                self.sign_languages_published += 1
                print("sign languages published: ", self.sign_languages_published)

def main(args=None):
    # Get the optional email argument from ROS parameter server
    email = rospy.get_param('~email', None)
    CamController(email)
    rospy.spin()

if __name__ == '__main__':
    main()
