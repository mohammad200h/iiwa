
require 'erb'
require 'matrix'
require_relative "iiwa"
require_relative "iiwaData"


class IIWAS
  attr_accessor :default_xml,:assets_xml,:body_xml,:contact_xml,:actuator_xml
  def initialize(poses,model="14")

    commen_xml = IIWA.new(body_pose=[0,0,0,0,0,0,1],model=model)
    robots = []
    for i in 0...poses.length
      pose = poses[i]

      iiwa = IIWA.new(pose,model,i.to_s)
      robots.push(iiwa)
    end


    ###### default ######
    @default_xml = commen_xml.default_xml
    ###### assets #######
    @assets_xml = commen_xml.assets_xml

    ###### robots body contact actuator #########
    @body_xml     = %{}
    @contact_xml  = %{}
    @actuator_xml = %{}

    robots.each do |robot|
      ###### body ######
      @body_xml += robot.body_xml
      ###### contact ######
      @contact_xml += robot.contact_xml
      ###### actuator #####
      @actuator_xml += robot.actuator_xml

    end





  end
end
