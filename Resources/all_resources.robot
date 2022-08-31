*** Settings ***
Resource  ./AgileResources/BasicResources/variables.robot
Resource  ./AgileResources/BasicResources/login_keywords.robot
Resource  ./AgileResources/BasicResources/reset_workspace.robot
Resource  ./AgileResources/BasicResources/delete_model.robot
Resource  ./AgileResources/BasicResources/create_model.robot
Resource  ./AgileResources/ModelCreationResources/confirm_setup.robot
Resource  ./AgileResources/ModelCreationResources/confirm_disabled_slider.robot
Resource  ./AgileResources/ModelOverviewResources/labels_shown.robot
Resource  ./AgileResources/ModelCreationResources/select_column.robot
Resource  ./AgileResources/ModelOverviewResources/add_label.robot
Resource  ./AgileResources/ModelOverviewResources/connect_dataset.robot
Resource  ./AgileResources/ModelOverviewResources/confidence_level.robot
Resource  ./AgileResources/ModelOverviewResources/test_model.robot
Library   ./AgileResources/BasicResources/remove_text.py