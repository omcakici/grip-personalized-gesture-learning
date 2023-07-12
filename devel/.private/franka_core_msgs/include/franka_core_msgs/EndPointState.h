// Generated by gencpp from file franka_core_msgs/EndPointState.msg
// DO NOT EDIT!


#ifndef FRANKA_CORE_MSGS_MESSAGE_ENDPOINTSTATE_H
#define FRANKA_CORE_MSGS_MESSAGE_ENDPOINTSTATE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/WrenchStamped.h>
#include <geometry_msgs/WrenchStamped.h>

namespace franka_core_msgs
{
template <class ContainerAllocator>
struct EndPointState_
{
  typedef EndPointState_<ContainerAllocator> Type;

  EndPointState_()
    : header()
    , O_T_EE()
    , O_F_ext_hat_K()
    , K_F_ext_hat_K()  {
      O_T_EE.assign(0.0);
  }
  EndPointState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , O_T_EE()
    , O_F_ext_hat_K(_alloc)
    , K_F_ext_hat_K(_alloc)  {
  (void)_alloc;
      O_T_EE.assign(0.0);
  }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef boost::array<double, 16>  _O_T_EE_type;
  _O_T_EE_type O_T_EE;

   typedef  ::geometry_msgs::WrenchStamped_<ContainerAllocator>  _O_F_ext_hat_K_type;
  _O_F_ext_hat_K_type O_F_ext_hat_K;

   typedef  ::geometry_msgs::WrenchStamped_<ContainerAllocator>  _K_F_ext_hat_K_type;
  _K_F_ext_hat_K_type K_F_ext_hat_K;





  typedef boost::shared_ptr< ::franka_core_msgs::EndPointState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::franka_core_msgs::EndPointState_<ContainerAllocator> const> ConstPtr;

}; // struct EndPointState_

typedef ::franka_core_msgs::EndPointState_<std::allocator<void> > EndPointState;

typedef boost::shared_ptr< ::franka_core_msgs::EndPointState > EndPointStatePtr;
typedef boost::shared_ptr< ::franka_core_msgs::EndPointState const> EndPointStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::franka_core_msgs::EndPointState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::franka_core_msgs::EndPointState_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::franka_core_msgs::EndPointState_<ContainerAllocator1> & lhs, const ::franka_core_msgs::EndPointState_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.O_T_EE == rhs.O_T_EE &&
    lhs.O_F_ext_hat_K == rhs.O_F_ext_hat_K &&
    lhs.K_F_ext_hat_K == rhs.K_F_ext_hat_K;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::franka_core_msgs::EndPointState_<ContainerAllocator1> & lhs, const ::franka_core_msgs::EndPointState_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace franka_core_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_core_msgs::EndPointState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_core_msgs::EndPointState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_core_msgs::EndPointState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "157e46b2d97e94a67549f0fd8090f80c";
  }

  static const char* value(const ::franka_core_msgs::EndPointState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x157e46b2d97e94a6ULL;
  static const uint64_t static_value2 = 0x7549f0fd8090f80cULL;
};

template<class ContainerAllocator>
struct DataType< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "franka_core_msgs/EndPointState";
  }

  static const char* value(const ::franka_core_msgs::EndPointState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"\n"
"float64[16] O_T_EE # Measured end effector pose in base frame\n"
"\n"
"# ----- Moved ee velocity to robot state, because it is being computed using J*dq. EE vel is not being provided natively\n"
"#float64[6] O_dP_EE_c # Last commanded end effector twist in base frame.\n"
"#float64[6] O_dP_EE_d # Desired end effector twist in base frame.\n"
"#float64[6] O_ddP_EE_c # Last commanded end effector acceleration in base frame.\n"
"\n"
"geometry_msgs/WrenchStamped O_F_ext_hat_K    # Estimated external wrench (force, torque) acting on stiffness frame, expressed relative to the base frame\n"
"geometry_msgs/WrenchStamped K_F_ext_hat_K    # Estimated external wrench (force, torque) acting on stiffness frame, expressed relative to the stiffness frame (ee_frame by default)\n"
"\n"
"\n"
"\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/WrenchStamped\n"
"# A wrench with reference coordinate frame and timestamp\n"
"Header header\n"
"Wrench wrench\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Wrench\n"
"# This represents force in free space, separated into\n"
"# its linear and angular parts.\n"
"Vector3  force\n"
"Vector3  torque\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::franka_core_msgs::EndPointState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.O_T_EE);
      stream.next(m.O_F_ext_hat_K);
      stream.next(m.K_F_ext_hat_K);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EndPointState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::franka_core_msgs::EndPointState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::franka_core_msgs::EndPointState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "O_T_EE[]" << std::endl;
    for (size_t i = 0; i < v.O_T_EE.size(); ++i)
    {
      s << indent << "  O_T_EE[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.O_T_EE[i]);
    }
    s << indent << "O_F_ext_hat_K: ";
    s << std::endl;
    Printer< ::geometry_msgs::WrenchStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.O_F_ext_hat_K);
    s << indent << "K_F_ext_hat_K: ";
    s << std::endl;
    Printer< ::geometry_msgs::WrenchStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.K_F_ext_hat_K);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRANKA_CORE_MSGS_MESSAGE_ENDPOINTSTATE_H
