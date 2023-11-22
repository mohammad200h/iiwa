def get_iiwa(model="14",prefix=nil)

    ###### Material ####
    # https://rgbcolorpicker.com/0-1
    materials =[
        #colors used for visual
        {
          "name"=>"gray",
          "rgba"=>[0.4,0.4,0.4,1]
        },
        {
          "name"=>"light_gray",
          "rgba"=>[0.6,0.6,0.6,1]
        },
        {
          "name"=>"black",
          "rgba"=>[0,0,0,1]
        },
        {
          "name"=>"orange",
          "rgba"=>[1,0.423529,0.0392157,1]
        },
        #colors used for collision groups
        {
            "name"=>"light_orange",
            "rgba"=>[1, 0.749, 0,1]
        },
        {
            "name"=>"green",
            "rgba"=>[0.11, 1, 0,1]
        }
      ]


    ###### Links #######
    links_14 =[
        {
            "name" => "base",
            "childclass" =>"iiwa",
            "pos"=> [-0.1,0,0.07],
            "i"=>{
                "mass"=>5,
                "pos"=>[-0.1,0,0.07],
                "di"=>[0.05,0.06,0.03] #diaginertia
            },
            "g_visual"=>[
                {
                    "mesh"=>"link_0"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.12,
                    "pos"=>[0,0,0.03],
                    "mat"=>"green"
                },
                {
                    "size"=>0.08,
                    "pos"=>[-0.08,0,0.103],
                    "mat"=>"green"
                },
                {
                    "size"=>0.08,
                    "pos"=>[-0.08,0,0.04],
                    "mat"=>"green"
                },
                {
                    "size"=>0.1,
                    "pos"=>[0,0,0.14],
                    "mat"=>"green"
                },
            ]
        },

        {
            "name"=> "link1",
            "pos"=> [0,0,0.1575],
            "i"=>{
                "mass"=>5,
                "pos"=>[-0.1,0,0.07],
                "di"=>[0.05,0.06,0.03] #diaginertia
            },
            "j"=>{
                "name"=>"joint1",
                "class"=>"joint1"
            },
            "g_visual"=>[
                {
                    "mesh"=>"link_1"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.08,
                    "pos"=>[0,0,-0.0005],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0.01, -0.025, 0.0425],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[-0.01, -0.025,0.0425],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.07,
                    "pos"=>[0.01,-0.045,0.1025],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.07,
                    "pos"=>[-0.01,-0.045,0.1025],
                    "mat"=>"light_orange"
                },

            ]
        },

        {
            "name"=> "link2",
            "pos"=> [0,0,0.2025],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>6.35,
                "pos"=>[0.0003,0.059,0.042],
                "quat"=>[0,0,1,1],
                "di"=>[0.0305,0.0304,0.011] #diaginertia
            },
            "j"=>{
                "name"=> "joint2",
                "class"=>"joint2"
            },
            "g_visual"=>[
                {
                    "material"=>"orange",
                    "mesh"=>"link_2_orange"
                },
                {

                    "mesh"=>"link_2_grey"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.095,
                    "pos"=>[0,0,-0.01],
                    "mat"=>"green"
                },
                {
                    "size"=>0.09,
                    "pos"=>[0,0,0.045],
                    "mat"=>"green"
                },
                {
                    "size"=>0.07,
                    "pos"=>[-0.01,0.04,0.054],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[-0.01,0.09,0.04],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[-0.01,0.13,0.02],
                    "mat"=>"green"
                },
                {
                    "size"=>0.07,
                    "pos"=>[0.01,0.04,0.054],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0.01,0.09,0.04],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0.01,0.13,0.02],
                    "mat"=>"green"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0.18,0],
                    "mat"=>"green"
                },

            ]
        },

        {
            "name"=> "link3",
            "pos"=> [0,0.2045,0],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>3.5,
                "pos"=>[0,0.03,0.13],
                "di"=>[0.025,0.0238,0.0076] #diaginertia
            },
            "j"=>{
                "name"=> "joint3",
                "class"=>"joint1"
            },
            "g_visual"=>[
                {
                    "material"=>"light_gray",
                    "mesh"=>"band"
                },
                {
                    "mesh"=>"link_3"
                },
                {
                    "material"=>"black",
                    "mesh"=>"kuka"
                },

            ],
            "g_col"=>[
                {
                    "size"=>0.075,
                    "pos"=>[0,0,0.0355],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[0.01,0.023,0.0855],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.055,
                    "pos"=>[0.01,0.048,0.1255],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[0.01,0.056,0.1755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[-0.01,0.023,0.0855],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.055,
                    "pos"=>[-0.01,0.048,0.1255],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[-0.01,0.056,0.1755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0.045,0.2155],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0,0.2155],
                    "mat"=>"light_orange"
                },


            ]
        },

        {
            "name"=> "link4",
            "pos"=> [0,0,0.2155],
            "quat"=>[1,1,0,0],
            "i"=>{
                "mass"=>3.5,
                "pos"=>[0,0.067,0.034],
                "quat"=>[1,1,0,0],
                "di"=>[0.017,0.0164,0.006] #diaginertia
            },
            "j"=>{
                "name"=> "joint4",
                "class"=>"joint2"
            },
            "g_visual"=>[
                {
                    "material"=>"orange",
                    "mesh"=>"link_4_orange"
                },
                {
                    "mesh"=>"link_4_grey"
                }

            ],
            "g_col"=>[
                {
                    "size"=>0.078,
                    "pos"=>[0,0.01,0.046],
                    "mat"=>"green"
                },
                {
                    "size"=>0.06,
                    "pos"=>[0.01,0.06,0.052],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0.01,0.12,0.034],
                    "mat"=>"green"
                },
                {
                    "size"=>0.06,
                    "pos"=>[-0.01,0.06,0.052],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[-0.01,0.12,0.034],
                    "mat"=>"green"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0.184,0],
                    "mat"=>"green"
                },



            ]
        },

        {
            "name"=>  "link5",
            "pos"=> [0,0.1845,0],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>3.5,
                "pos"=>[0.0001,0.021,0.076],
                "di"=>[0.01,0.0087,0.00449] #diaginertia
            },
            "j"=>{
                "name"=> "joint5",
                "class"=>"joint1"
            },
            "g_visual"=>[
                {
                    "material"=>"light_gray",
                    "mesh"=>"band"
                },
                {
                    "mesh"=>"link_5"
                },
                {
                    "material"=>"black",
                    "mesh"=>"kuka"
                },

            ],
            "g_col"=>[
                {
                    "size"=>0.075,
                    "pos"=>[0,0,0.0335],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.05,
                    "pos"=>[-0.012,0.031,0.0755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.05,
                    "pos"=>[0.012,0.031,0.0755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[-0.012,0.06,0.1155],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[0.012,0.06,0.1155],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[-0.01,0.065,0.1655],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[0.01,0.065,0.1655],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.035,
                    "pos"=>[-0.012,0.065,0.1855],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.035,
                    "pos"=>[0.012,0.065,0.1855],
                    "mat"=>"light_orange"
                },




            ]
        },

        {
            "name"=>  "link6",
            "pos"=> [0,0,0.2155],
            "quat"=>[1,1,0,0],
            "i"=>{
                "mass"=>1.8,
                "pos"=>[0,0.0006,0.0004],
                "quat"=>[1,1,0,0],
                "di"=>[0.0049,0.0047,0.0036] #diaginertia
            },
            "j"=>{
                "name"=> "joint6",
                "class"=>"joint2"
            },
            "g_visual"=>[
                {
                    "material"=>"orange",
                    "mesh"=>"link_6_orange"
                },
                {
                    "mesh"=>"link_6_grey"
                }

            ],
            "g_col"=>[
                {
                    "size"=>0.055,
                    "pos"=>[0,0,-0.059],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0,-0.03,0.011],
                    "mat"=>"green"
                },
                {
                    "size"=>0.08,
                    "pos" =>[0,0,0],
                    "mat"=>"green"
                }

            ]
        },

        {
            "name"=>  "link7",
            "pos"=> [0,0.081,0],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>1.2,
                "pos"=>[0,0,0.02],
                "di"=>[0.001,0.001,0.001] #diaginertia
            },
            "j"=>{
                "name"=> "joint7",
                "class"=>"joint3"
            },
            "g_visual"=>[
                {
                    "mesh"=>"link_7"
                }

            ],
            "g_col"=>[
                {
                    "size"=>0.06,
                    "pos"=>[0,0,0.001],
                    "mat"=>"light_orange"
                }

            ]
        }


    ]
    #TODO
    links_7 =[
        {
            "name" => "base",
            "childclass" =>"iiwa",
            "pos"=> [-0.1,0,0.07],
            "i"=>{
                "mass"=>5,
                "pos"=>[-0.1,0,0.07],
                "di"=>[0.05,0.06,0.03] #diaginertia
            },
            "g_visual"=>[
                {
                    "mesh"=>"link_0"
                }
            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_0"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.12,
                    "pos"=>[0,0,0.03],
                    "mat"=>"green"
                },
                {
                    "size"=>0.08,
                    "pos"=>[-0.08,0,0.103],
                    "mat"=>"green"
                },
                {
                    "size"=>0.08,
                    "pos"=>[-0.08,0,0.04],
                    "mat"=>"green"
                },
                {
                    "size"=>0.1,
                    "pos"=>[0,0,0.14],
                    "mat"=>"green"
                },
            ]
        },

        {
            "name"=> "link1",
            "pos"=> [0,0,0.1575],
            "i"=>{
                "mass"=>5,
                "pos"=>[-0.1,0,0.07],
                "di"=>[0.05,0.06,0.03] #diaginertia
            },
            "j"=>{
                "name"=>"joint1",
                "class"=>"joint1"
            },
            "g_visual"=>[
                {
                    "mesh"=>"link_1"
                }
            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_1"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.08,
                    "pos"=>[0,0,-0.0005],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0.01, -0.025, 0.0425],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[-0.01, -0.025,0.0425],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.07,
                    "pos"=>[0.01,-0.045,0.1025],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.07,
                    "pos"=>[-0.01,-0.045,0.1025],
                    "mat"=>"light_orange"
                },

            ]
        },

        {
            "name"=> "link2",
            "pos"=> [0,0,0.1825],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>6.35,
                "pos"=>[0.0003,0.059,0.042],
                "quat"=>[0,0,1,1],
                "di"=>[0.0305,0.0304,0.011] #diaginertia
            },
            "j"=>{
                "name"=> "joint2",
                "class"=>"joint2"
            },
            "g_visual"=>[
                {
                    "material"=>"orange",
                    "mesh"=>"link_2_orange"
                },
                {

                    "mesh"=>"link_2_grey"
                }
            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_2"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.095,
                    "pos"=>[0,0,-0.01],
                    "mat"=>"green"
                },
                {
                    "size"=>0.09,
                    "pos"=>[0,0,0.045],
                    "mat"=>"green"
                },
                {
                    "size"=>0.07,
                    "pos"=>[-0.01,0.04,0.054],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[-0.01,0.09,0.04],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[-0.01,0.13,0.02],
                    "mat"=>"green"
                },
                {
                    "size"=>0.07,
                    "pos"=>[0.01,0.04,0.054],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0.01,0.09,0.04],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0.01,0.13,0.02],
                    "mat"=>"green"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0.18,0],
                    "mat"=>"green"
                },

            ]
        },

        {
            "name"=> "link3",
            "pos"=> [0,0.1845,0],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>3.5,
                "pos"=>[0,0.03,0.13],
                "di"=>[0.025,0.0238,0.0076] #diaginertia
            },
            "j"=>{
                "name"=> "joint3",
                "class"=>"joint1"
            },
            "g_visual"=>[
                {
                    "material"=>"light_gray",
                    "mesh"=>"band"
                },
                {
                    "mesh"=>"link_3"
                },
                {
                    "material"=>"black",
                    "mesh"=>"kuka"
                },

            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_3_i"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.075,
                    "pos"=>[0,0,0.0355],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[0.01,0.023,0.0855],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.055,
                    "pos"=>[0.01,0.048,0.1255],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[0.01,0.056,0.1755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[-0.01,0.023,0.0855],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.055,
                    "pos"=>[-0.01,0.048,0.1255],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.06,
                    "pos"=>[-0.01,0.056,0.1755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0.045,0.2155],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0,0.2155],
                    "mat"=>"light_orange"
                },


            ]
        },

        {
            "name"=> "link4",
            "pos"=> [0,0,0.2155],
            "quat"=>[1,1,0,0],
            "i"=>{
                "mass"=>3.5,
                "pos"=>[0,0.067,0.034],
                "quat"=>[1,1,0,0],
                "di"=>[0.017,0.0164,0.006] #diaginertia
            },
            "j"=>{
                "name"=> "joint4",
                "class"=>"joint2"
            },
            "g_visual"=>[
                {
                    "material"=>"orange",
                    "mesh"=>"link_4_orange"
                },
                {
                    "mesh"=>"link_4_grey"
                }

            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_4"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.078,
                    "pos"=>[0,0.01,0.046],
                    "mat"=>"green"
                },
                {
                    "size"=>0.06,
                    "pos"=>[0.01,0.06,0.052],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0.01,0.12,0.034],
                    "mat"=>"green"
                },
                {
                    "size"=>0.06,
                    "pos"=>[-0.01,0.06,0.052],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[-0.01,0.12,0.034],
                    "mat"=>"green"
                },
                {
                    "size"=>0.075,
                    "pos"=>[0,0.184,0],
                    "mat"=>"green"
                },



            ]
        },

        {
            "name"=>  "link5",
            "pos"=> [0,0.1845,0],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>3.5,
                "pos"=>[0.0001,0.021,0.076],
                "di"=>[0.01,0.0087,0.00449] #diaginertia
            },
            "j"=>{
                "name"=> "joint5",
                "class"=>"joint1"
            },
            "g_visual"=>[
                {
                    "material"=>"light_gray",
                    "mesh"=>"band"
                },
                {
                    "mesh"=>"link_5"
                },
                {
                    "material"=>"black",
                    "mesh"=>"kuka"
                },

            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_5_i"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.075,
                    "pos"=>[0,0,0.0335],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.05,
                    "pos"=>[-0.012,0.031,0.0755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.05,
                    "pos"=>[0.012,0.031,0.0755],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[-0.012,0.06,0.1155],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[0.012,0.06,0.1155],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[-0.01,0.065,0.1655],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.04,
                    "pos"=>[0.01,0.065,0.1655],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.035,
                    "pos"=>[-0.012,0.065,0.1855],
                    "mat"=>"light_orange"
                },
                {
                    "size"=>0.035,
                    "pos"=>[0.012,0.065,0.1855],
                    "mat"=>"light_orange"
                },




            ]
        },

        {
            "name"=>  "link6",
            "pos"=> [0,0,0.2155],
            "quat"=>[1,1,0,0],
            "i"=>{
                "mass"=>1.8,
                "pos"=>[0,0.0006,0.0004],
                "quat"=>[1,1,0,0],
                "di"=>[0.0049,0.0047,0.0036] #diaginertia
            },
            "j"=>{
                "name"=> "joint6",
                "class"=>"joint2"
            },
            "g_visual"=>[
                {
                    "material"=>"orange",
                    "mesh"=>"link_6_orange"
                },
                {
                    "mesh"=>"link_6_grey"
                }

            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_6"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.055,
                    "pos"=>[0,0,-0.059],
                    "mat"=>"green"
                },
                {
                    "size"=>0.065,
                    "pos"=>[0,-0.03,0.011],
                    "mat"=>"green"
                },
                {
                    "size"=>0.08,
                    "pos" =>[0,0,0],
                    "mat"=>"green"
                }

            ]
        },

        {
            "name"=>  "link7",
            "pos"=> [0,0.081,0],
            "quat"=>[0,0,1,1],
            "i"=>{
                "mass"=>1.2,
                "pos"=>[0,0,0.02],
                "di"=>[0.001,0.001,0.001] #diaginertia
            },
            "j"=>{
                "name"=> "joint7",
                "class"=>"joint3"
            },
            "g_visual"=>[
                {
                    "mesh"=>"link_7"
                }

            ],
            "g_inertia"=>[
                {
                    "mesh"=>"link_7"
                }
            ],
            "g_col"=>[
                {
                    "size"=>0.06,
                    "pos"=>[0,0,0.001],
                    "mat"=>"light_orange"
                }

            ]
        }


    ]




    ##### Actuators ######
    actuators_14 = [
        {
            "name"  => "actuator1",
            "joint" => "joint1",
            "class" => "joint1"
        },
        {
            "name"  => "actuator2",
            "joint" => "joint2",
            "class" => "joint2"
        },
        {
            "name"  => "actuator3",
            "joint" => "joint3",
            "class" => "joint1"
        },
        {
            "name"  => "actuator4",
            "joint" => "joint4",
            "class" => "joint2"
        },
        {
            "name"  => "actuator5",
            "joint" => "joint5",
            "class" => "joint1"
        },
        {
            "name"  => "actuator6",
            "joint" => "joint6",
            "class" => "joint2"
        },
        {
            "name"  => "actuator7",
            "joint" => "joint7",
            "class" => "joint3"
        }
    ]
    #TODO
    actuators_7 = actuators_14




    ###### Defaults #####
    default_14={
        "gType" => "fixed" ,
        "bType" => "affine",
        "gPrm"  => 2000,
        "bPrm"  => [0, -2000, -200],
        "joint1"=>{
            "range"     =>[-2.96706,2.96706],
            "ctrlrange" =>[-2.96706,2.96706]
        },
        "joint2"=>{
            "range"     =>[-2.0944,2.0944],
            "ctrlrange" =>[-2.0944,2.0944]
        },
        "joint3"=>{
            "range"     =>[-3.05433,3.05433],
            "ctrlrange" =>[-3.05433,3.05433]
        }


    }
    #TODO
    default_7 = default_14


    ####### meshes #######
    common_meshes = [
        "band.obj",
        "kuka.obj",
        "link_3.obj",
        "link_3_i.obj",
        "link_4.obj",
        "link_4_orange.obj",
        "link_4_grey.obj",
        "link_5.obj",
        "link_5_i.obj",
        "link_6.obj",
        "link_6_orange.obj",
        "link_6_grey.obj",
        "link_7.obj"
    ]

    meshes_14 = [
      "link_0.obj",
      "link_1.obj",
      "link_2.obj",
      "link_2_orange.obj",
      "link_2_grey.obj"
    ]

    meshes_7 = [
      "link_0.obj",
      "link_1.obj",
      "link_2.obj",
      "link_2_grey.obj",
      "link_2_orange.obj"
    ]

    ###### setting up the arm #######

    defaults =nil
    if model=="14"
        links  = links_14
        actuators = actuators_14
        defaults = default_14
        meshes = meshes_14

    elsif model=="7"
        links  = links_7
        actuators = actuators_7
        defaults = default_7
        meshes = meshes_7
    else
        puts "Wrong model! choose 14 or 7"
    end

    ########## adding prefixes ########
    # adding prefix to robot
    if prefix
        for i in 0...links.length
            links[i]["name"] = links[i]["name"]+"_"+prefix
            if links[i].key?("j")
                # puts links[i]["j"]["name"]
                # puts links[i]["j"]["name"]+"_"+prefix
                links[i]["j"]["name"] = links[i]["j"]["name"]+"_"+prefix
            end

        end
    end

    if prefix
        for i in 0...actuators.length
            actuators[i]["name"] = actuators[i]["name"]+"_"+prefix
            actuators[i]["joint"] = actuators[i]["joint"]+"_"+prefix
        end
    end


    return links,actuators,defaults,common_meshes,meshes,materials,prefix
end

def get_iiwa_joint_type(class_name)
    return "hinge"
end
