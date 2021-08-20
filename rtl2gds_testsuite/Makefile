THIS_DIR :=$(realpath $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

#GIT_CLONE_STYLE :=ssh
GIT_CLONE_STYLE :=https

ifeq ($(GIT_CLONE_STYLE),ssh)
  GITHUB    :=git@github.com:
  BITBUCKET :=git@bitbucket.com:

else ifeq ($(GIT_CLONE_STYLE),https)
  GITHUB    :=https://github.com/
  BITBUCKET :=https://bitbucket.com/

endif

bsg_fakeram_wrapper_dir    :=$(THIS_DIR)/bsg_fakeram_wrapper
bsg_realram_wrapper_dir    :=$(THIS_DIR)/bsg_realram_wrapper
bsg_manycore_tile_withfakeram_dir      :=$(THIS_DIR)/bsg_manycore_tile_compute_mesh
bsg_mancore_tile_withrealsram_dir      :=$(THIS_DIR)/bsg_manycore_tile_compute_mesh_real
black_parrot_fe_dir        :=$(THIS_DIR)/black_parrot_fe
black_parrot_dir           :=$(THIS_DIR)/black_parrot

bsg_fakeram_dir      :=$(THIS_DIR)/bsg_fakeram
bsg_fakeram_url      :=$(GITHUB)bespoke-silicon-group/bsg_fakeram
bsg_fakeram_commit   :=master

openlane_dir         :=$(THIS_DIR)/openlane
openlane_url         :=$(GITHUB)/efabless/OpenLane.git
openlane_commit      :=v0.21

current_design       :=bsg_fakeram_wrapper

all_repos = $(subst _url,.repo,$(filter %_url,$(.VARIABLES)))

tools: $(all_repos)
	@echo "$(all_repos)"
	@cd $(bsg_fakeram_dir); git checkout $(bsg_fakeram_commit)
	@cd $(openlane_dir); git checkout $(openlane_commit)
	@$(MAKE) -C $(bsg_fakeram_dir) tools
	@$(MAKE) -C $(openlane_dir) openlane

%.repo:
	-git clone $($*_url) $($*_dir)
	-cd $($*_dir) ; git checkout $($*_commit)

bsg_fakeram:
	@git clone $(bsg_fakeram_url) $(bsg_fakeram_dir)
	@cd $(bsg_fakeram_dir); git checkout $(bsg_fakeram_commit)
	@$(MAKE) -C $(bsg_fakeram_dir) tools

%.design: 
	@echo "$(subst .design,,$(MAKECMDGOALS))">.current_design;
	@cp -R $($*_dir) openlane/designs/. ; 

config.view:
	@current_design=`cat .current_design`; vi $(openlane_dir)/designs/$$current_design/config.tcl

openlane:
	@git clone $(openlane_url) $(openlane_dir)
	@cd $(openlane_dir); git checkout $(openlane_commit)
	@$(MAKE) -C $(openlane_dir) openlane
	
pdk:
	@cd $(openlane_dir);$(MAKE) pdk;

%.design: 
	@echo "$(subst .design,,$(MAKECMDGOALS))">.current_design;
	@cp -R $($*_dir) openlane/designs/. ; 

config.edit:
	@current_design=`cat .current_design`; vi $(openlane_dir)/designs/$$current_design/config.tcl

%_config.edit:
	@current_design=`cat .current_design`; vi $(openlane_dir)/designs/$$current_design/sky130A_sky130_fd_$(subst .edit,.tcl,$(MAKECMDGOALS))

latest.run:
	@current_design=`cat .current_design`; if [ -d $(openlane_dir)/designs/$$current_design/runs ]; then cd $(openlane_dir)/designs/$$current_design/runs;ls;latest=`ls -td -- */ | head -n 1`; echo latest:$(openlane_dir)/designs/$$current_design/runs/$$latest ; else echo "No runs yet."; fi

clean_designs:
	@if [ -d "$(openlane_dir)/designs/bsg_fakeram_wrapper" ] && [ -e "$(openlane_dir)/designs/bsg_fakeram_wrapper" ]; then rm -rf "$(openlane_dir)/designs/bsg_fakeram_wrapper"; fi
	@if [ -d "$(openlane_dir)/designs/bsg_realram_wrapper" ] && [ -e "$(openlane_dir)/designs/bsg_realram_wrapper" ]; then rm -rf "$(openlane_dir)/designs/bsg_realram_wrapper"; fi
	@if [ -d "$(openlane_dir)/designs/bsg_manycore_tile_compute_mesh" ] && [ -e "$(openlane_dir)/designs/bsg_manycore_tile_compute_mesh" ]; then rm -rf "$(openlane_dir)/designs/bsg_manycore_tile_compute_mesh"; fi
	@if [ -d "$(openlane_dir)/designs/bsg_manycore_tile_compute_mesh_real" ] && [ -e "$(openlane_dir)/designs/bsg_manycore_tile_compute_mesh_real" ]; then rm -rf "$(openlane_dir)/designs/bsg_manycore_tile_compute_mesh_real"; fi
	@if [ -d "$(openlane_dir)/designs/bp_fe_top" ] && [ -e "$(openlane_dir)/designs/bp_fe_top" ]; then rm -rf "$(openlane_dir)/designs/bp_fe_top"; fi
	@if [ -d "$(openlane_dir)/designs/black_parrot" ] && [ -e "$(openlane_dir)/designs/black_parrot" ]; then rm -rf "$(openlane_dir)/designs/black_parrot"; fi
	@echo "Designs and Configs Removed from OpenLane"

clean: 	safety_prompt
	rm -rf $(subst .repo,,$(all_repos))


safety_prompt:
	@echo -n "Configs and Design will be lost. Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]

