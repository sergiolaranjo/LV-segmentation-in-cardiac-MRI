function write_results(results_folder, all_compare_result) %#ok<DEFNU>
%WRITE_RESULT Write compare result to xls(excel) file
%   WRITE_RESULT(RESULTS_FOLDER,ALL_COMPARE_RESULT)
%
%   Copyright: Imaging Research, Sunnybrook Health Sciences Centre, Toronto, ON, Canada
%   Author: Perry Radau and Yingli Lu
%   Email: perry.radau@gmail.com
%   Version: 1.0
%   Date: 2009/06/29

% check path for results files
if ~exist(results_folder,'dir')
    try
       mkdir(results_folder)
    catch
       s = lasterror;
       disp(s.message);
       disp('No results folder!');
       return;
    end
end


%write text file file with name yyyymmddTHHMMSS.xls indicating date and
%time of creation. Columns are tab separated.
full_filename = [results_folder filesep datestr(now,'yyyymmddTHHMMSS') '.xls'];

try 
    result_file = fopen(full_filename,'w');
    summary.headings = {'patient_id',...
                        'auto_number_i', 'auto_number_o', ...
                        'manual_number_i','manual_number_o',...
                        'detect_percent_i(%)','detect_percent_o(%)',...
                        'good_percent_i(%)','good_percent_o(%)',...
                        'auto_ef_pic(%)','auto_ef_pim(%)',...
                        'auto_lvm_pic(g)','auto_lvm_pim(g)',...
                        'manual_ef_pic(%)','manual_ef_pim(%)',...
                        'manual_lvm_pic(g)','manual_lvm_pim(g)',...
                        'avg_dist_i(mm)','avg_dist_o(mm)',...
                        'avg_dm_i','avg_dm_o',...
                        'auto_edv_pic','auto_edv_pim',...
                        'manual_edv_pic','manual_edv_pim',...
                        'auto_esv_pic','auto_esv_pim',...
                        'manual_esv_pic','manual_esv_pim'}; 
                 
    fprintf(result_file, '%s\t', summary.headings{:});

    for i=1:length(all_compare_result)
        if ~isempty(all_compare_result{i})
            fprintf(result_file, '\n %s\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t %6.4f\t',...
                        all_compare_result{i}.patient_id,...
                        all_compare_result{i}.auto_number_i, all_compare_result{i}.auto_number_o, ...
                        all_compare_result{i}.manual_number_i,all_compare_result{i}.manual_number_o,...
                        all_compare_result{i}.detect_percent_i, all_compare_result{i}.detect_percent_o,...
                        all_compare_result{i}.good_percent_i,all_compare_result{i}.good_percent_o,...
                        all_compare_result{i}.auto_ef_pic,all_compare_result{i}.auto_ef_pim,...
                        all_compare_result{i}.auto_lvm_pic,all_compare_result{i}.auto_lvm_pim,...
                        all_compare_result{i}.manual_ef_pic,all_compare_result{i}.manual_ef_pim,...
                        all_compare_result{i}.manual_lvm_pic,all_compare_result{i}.manual_lvm_pim,...
                        all_compare_result{i}.avg_dist_i,all_compare_result{i}.avg_dist_o,...
                        all_compare_result{i}.avg_dm_i,all_compare_result{i}.avg_dm_o,...
                        all_compare_result{i}.auto_edv_pic,all_compare_result{i}.auto_edv_pim,...
                        all_compare_result{i}.manual_edv_pic,all_compare_result{i}.manual_edv_pim,...
                        all_compare_result{i}.auto_esv_pic,all_compare_result{i}.auto_esv_pim,...
                        all_compare_result{i}.manual_esv_pic,all_compare_result{i}.manual_esv_pim);
        end
    end
    fclose(result_file);
catch
    s = lasterror;
    disp(s.message);
    return;
end

