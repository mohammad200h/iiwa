
require 'erb'
require 'matrix'
require_relative "Utility"
require_relative "iiwaData"

# puts "I am the link file being imported "


class Link
  attr_accessor :body_xml,:joint
  def initialize(data,compute_inertia=true,child=nil,collision_class=0,base_pose=nil)
    # puts "link"
    link_name = data["name"]

    childclass = data.key?("childclass") ? data["childclass"] : nil

    #link pose
    body_pos = data["pos"]
    body_orn = data.key?("quat") ? data["quat"] : nil

    if base_pose
      body_pos = base_pose.take(3)
      body_orn = base_pose.drop(3)
    end

    #joint
    j = data.key?("j") ? data["j"] : nil



    #intertia
    mass        = data ["i"]["mass"]
    i_pos       = data ["i"]["pos"]
    i_quat      = data ["i"]["quat"]
    diaginertia = data ["i"]["di"]

    #visuals
    v_l = data["g_visual"]

    #g_inertia
    g_inertia_l = data.key?("g_inertia") ? data["g_inertia"] : []

    #collisions
    c_l = data["g_col"]

    #TODO figure out the joint
    if j
      @joint = Joint.new(type=get_iiwa_joint_type(j["class"]),name=j["name"],axis=nil, pos=nil,
      euler=nil,class_dic = {
        "name"=>j["class"],
        "ignore"=>["type"]
      })
    end


    @assets_xml = %{}.gsub(/^  /, '')

    @default_xml = %{}.gsub(/^  /, '')

    #### generate body (link) name #########
    name_xml =  %{name="#{a_to_s(link_name)}"}
    ######## genrate body_pose ######
    pos_xml = %{pos="#{a_to_s(body_pos)}"}
    quat_xml = body_orn.nil? ? nil : %{quat="#{a_to_s(body_orn)}"}

    ###### generating childclass ######
    childclass_xml = childclass.nil? ? nil : %{childclass="#{a_to_s(childclass)}"}

    ######generate inertia#######
    inertia_xml= nil
    if !compute_inertia
      inertia_xml=%{
        <inertial mass="#{a_to_s(mass)}" pos="#{a_to_s(i_pos)}" diaginertia="#{a_to_s(diaginertia)}"/>
      }.gsub(/^  /, '')
    end
    ######generate visuals#######
    visuals_xml = %{}

    v_l.each do |v|

      mesh_xml     =  v.key?("mesh")      ?     %{ mesh="#{v["mesh"]}" }.gsub(/^  /, '')         : nil
      material_xml =  v.key?("material")  ?     %{ material="#{v["material"]}" }.gsub(/^  /, '') : nil



      v_xml = %{  <geom class="visual" #{mesh_xml} #{material_xml} />
      }.gsub(/^  /, '')

      visuals_xml += v_xml

    end

    ####### adding mesh for inertia and mass calculation ######

    mass_xml     =  compute_inertia     ?     %{ mass="#{a_to_s(mass)}" }.gsub(/^  /, '')      : nil
    g_inertia_xml = %{}


    if compute_inertia
      g_inertia_l.each do |g_i|

        mesh_xml     =  g_i.key?("mesh")      ?     %{ mesh="#{g_i["mesh"]}" }.gsub(/^  /, '')         : nil
        material_xml =  g_i.key?("material")  ?     %{ material="#{g_i["material"]}" }.gsub(/^  /, '') : nil



        g_i_xml = %{  <geom class="inertia" #{mesh_xml} #{material_xml} #{mass_xml}/>
        }.gsub(/^  /, '')

        g_inertia_xml += g_i_xml

      end
    end

    ######generate collisions#####
    collisions_xml = %{}


    c_l.each do |c|
      material_xml =  c.key?("mat")  ?     %{ material="#{c["mat"]}" }.gsub(/^  /, '') : nil

      c_xml = %{  <geom class="collision_#{collision_class}" size="#{c["size"]}" pos="#{a_to_s(c["pos"])}"/>
      }

      collisions_xml += c_xml
    end

    ######generate joint#####
    joint_xml = j.nil? ? nil: @joint.xml

    child_xml = child.nil?  ?     nil :child.body_xml


    @body_xml=%{
      <body #{name_xml} #{pos_xml} #{quat_xml} #{childclass_xml}>
        #{joint_xml}
        #{inertia_xml}
        #{visuals_xml}
        #{g_inertia_xml}
        #{collisions_xml}

          #{child_xml}

      </body>

    }.gsub(/^  /, '')

  end
end
