
files_in_folder{:,1} = dir(fullfile('../LogFiles/matfiles/avgAll/','*.mat'));
save('Avg_all_matfiles',"files_in_folder")