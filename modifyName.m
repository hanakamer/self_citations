function ModifiedName= modifyName(AuthorName)
%AuthorName      = getAuthorName(AuthorID);
AuthorName=strrep(AuthorName, 'van der', '');

%display(AuthorName);
Sliced_Name     =regexp(AuthorName, '(?<=[[A-Za-z-.]*\s*]*)[A-Za-z-.]*','match');

[b,a]=size(Sliced_Name);
%display(a);
%x=Sliced_Name{1}(1);
%display(x);
dash_place=strfind(Sliced_Name{1},'-');

if numel(dash_place)>0;
    slc_name= [regexp(Sliced_Name{1}, '[\w-.]*(?=(-))' ,'match') regexp(Sliced_Name{1},'(?<=(-))[\w-.]*','match')];
    
    Sliced_Name =[slc_name Sliced_Name{a}];
end

[b,a]=size(Sliced_Name);
result=[];
for i=1:(a);
    if i<a;
        %if isstrprop(Sliced_Name{i}(1), 'upper')==1;
            result=[result upper(Sliced_Name{i}(1))];
        %end
    elseif i==a;
    Sliced_Name{i}(1)=upper(Sliced_Name{i}(1));
    result=[result ' ' Sliced_Name{i}];
    end
end
ModifiedName=result;


end