
require 'erb'
require 'matrix'
require_relative "../utility/Utility"
require_relative "iiwaData"
require_relative "link"


class IIWA
  attr_accessor :default_xml,:assets_xml,:body_xml,:contact_xml,:actuator_xml,:name,:joints
  def initialize(body_pose=[0,0,0,0,0,0,1],model="14",children=nil,prefix=nil,compute_inertia=true)

    data =  get_iiwa(model,prefix)
    links,actuators,defaults,common_meshes,robot_meshes,materials,prefix = data
    @name = "iiwa"+model
    @joints = []



    asset_path = File.join(File.dirname(__FILE__),'assets')
    # puts asset_path
    ##### bodies #######
    parent_link = nil
    # puts links[links.length-1]
    # puts compute_inertia
    # puts children

    collision_class = 0
    child_link = Link.new(links[links.length-1],compute_inertia,children,collision_class)
    (links.length-1).downto(1) do |counter|
      if collision_class ==0
        collision_class = 1
      else
        collision_class = 0
      end
      parent_link = Link.new(links[counter-1],compute_inertia,child_link,collision_class)
      # if base link
      if counter ==1
        parent_link = Link.new(links[counter-1],compute_inertia,child_link,collision_class,body_pose)
      end

      child_link = parent_link


    end



    ######## assets ########
    class_name = "iiwa"
    meshes = []


    # common meshes
    for i in 0...common_meshes.length
      meshes.push(asset_path+"/common/"+common_meshes[i])
    end
    # robot specific meshes
    for i in 0...robot_meshes.length
      meshes.push(asset_path+"/"+@name+"/"+robot_meshes[i])
    end


    light_name_xml = prefix.nil? ? "top" : "top"+"_"+prefix

    ##### genrating assets #######
    @assets_xml = %{}

    materials.each do |m|
      @assets_xml += %{<material class="#{class_name}" name="#{m["name"]}" rgba="#{a_to_s(m["rgba"])}"/>}

    end

    meshes.each do |m|
      @assets_xml += %{<mesh file="#{m}"/>\n}

    end

    ###### genrating defaults ########
    @default_xml = %{
        <default class="#{class_name}">
          <material specular="0.5" shininess="0.25" />
          <joint axis="0 0 1" />
          <general gaintype="#{defaults["gType"]}" biastype="#{defaults["bType"]}" gainprm="#{defaults["gPrm"]}" biasprm="#{a_to_s(defaults["bPrm"])}" />
          <default class="joint1">
            <joint range="#{a_to_s(defaults["joint1"]["range"])}" />
            <general ctrlrange="#{a_to_s(defaults["joint1"]["ctrlrange"])}" />
            <default class="joint2">
              <joint range="#{a_to_s(defaults["joint2"]["range"])}" />
              <general ctrlrange="#{a_to_s(defaults["joint2"]["ctrlrange"])}" />
            </default>
          </default>
          <default class="joint3">
            <joint range="#{a_to_s(defaults["joint3"]["range"])}" />
            <general ctrlrange="#{a_to_s(defaults["joint3"]["ctrlrange"])}" />
          </default>
          <default class="visual">
            <geom type="mesh" contype="0" conaffinity="0" group="2" material="gray" mass="0"/>
          </default>
          <default class="inertia">
            <geom type="mesh" group="4" />
          </default>
          <default class="collision">
            <geom group="3" mass="0"/>
            <default class="collision_0">
              <geom  material="green"/>
            </default>
            <default class="collision_1">
              <geom  material="light_orange"/>
            </default>
          </default>
          <site size="0.001" rgba="1 0 0 1" group="4" />
        </default>
    }.gsub(/^ /, '')

    ###### generating bodys
    @body_xml=%{
      <light name="#{light_name_xml}" pos="0 0 2" mode="trackcom"/>
      #{parent_link.body_xml}


    }.gsub(/^ /, '')



    ########## generate contact ########
    @contact_xml = %{<exclude body1="#{links[0]["name"]}" body2="#{links[1]["name"]}"/>}

    ########## genrating actuators ########
    @actuator_xml = %{}
    actuators.each do |a|
      @actuator_xml += %{<general name="#{a["name"]}" joint="#{a["joint"]}" class="#{a["class"]}"/> \n\t\t}
    end



  end
end
