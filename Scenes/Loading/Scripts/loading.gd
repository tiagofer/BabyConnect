extends Node2D

var loader
var wait_frames
var time_max = 100 # msec
var loadbar
var current_scene

var admob = null
var admob_banner_id = "ca-app-pub-6404552898440853/1679268287"
var admob_inter_id = "ca-app-pub-6404552898440853/6733952711"

func _ready():
	loadbar = get_node("progress")
	loadbar.set_value(0)
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
#	
#	if (Globals.has_singleton("bbAdmob")):
#		admob = Globals.get_singleton("bbAdmob")
#		admob.init_admob_test(get_instance_ID(), admob_banner_id, admob_inter_id, false)

func goto_scene(path): # game requests to switch to this scene
    loader = ResourceLoader.load_interactive(path)
    if loader == null: # check for errors
        show_error()
        return
    set_process(true)

    current_scene.queue_free() # get rid of the old scene

    wait_frames = 1

func _process(time):
    if loader == null:
        # no need to process anymore
        set_process(false)
        return

    if wait_frames > 0: # wait for frames to let the "loading" animation to show up
        wait_frames -= 1
        return

    var t = OS.get_ticks_msec()
    while OS.get_ticks_msec() < t + time_max: # use "time_max" to control how much time we block this thread

        # poll your loader
        var err = loader.poll()

        if err == ERR_FILE_EOF: # load finished
            var resource = loader.get_resource()
            loader = null
            set_new_scene(resource)
            break
        elif err == OK:
            update_progress()
        else: # error during loading
            show_error()
            loader = null
            break

func update_progress():
    var progress = float(loader.get_stage()) / loader.get_stage_count()
    # update your progress bar?
    loadbar.set_value(progress*100.0 + 7.0)
#    printt(progress*100)

func set_new_scene(scene_resource):
    current_scene = scene_resource.instance()
    get_node("/root").add_child(current_scene)
    ad_control.count_interstitial+=1
    if (admob != null and ad_control.count_interstitial >= 20):
    	admob.show_interstitial()
    	ad_control.count_interstitial = 0
    