% Choose data files and corresponding line colours

switch icase
    case {1}
        scheme = 'scheme10e';
        ls = 'k';
    case {2}
        scheme = 'scheme10edt5';
        ls = 'r';
    otherwise
        disp('*** Unknown scheme ***')
        pause
end

% switch icase
%     case {1}
%         scheme = 'scheme0';
%         ls = 'r';
%     case {2}
%         scheme = 'scheme0ug1';
%         ls ='g';
%     case {3}
%         scheme = 'scheme1';
%         ls = 'b';
%     case {4}
%         scheme = 'scheme3';
%         ls = 'k';
%     otherwise
%         disp('*** Unknown scheme ***')
%         pause
% end