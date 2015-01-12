function [CitationID,ListCoAuthorNames,CitationNumber] = getCoAuthors(AuthorID,ArticleID)
% Creates a list of all author names for a given article
%&sortby=pubdate

targetURL     = ['http://scholar.google.ch/citations?view_op=view_citation&hl=en&user=' AuthorID '&citation_for_view=' AuthorID ':' ArticleID];
source_code   =urlread(targetURL);
             %The citationID is on this page if the article is cited at least once
%it would have a field like this
%http://scholar.google.ch/scholar?oi=bibs&hl=en&cites=CitationID 

AuthorName      = getAuthorName(AuthorID);
display(AuthorName);
LastName        = regexp(AuthorName, '(?<=(\s))[\w]*','match');
display(LastName{1});
A                   =regexp(source_code,'(?<=(cites=))[[\w-]{12}]*', 'match');
CitationID          = A{1};
path_1              = strcat('(?<=(',LastName{1});
path_2              = strcat(path_1, ')(,  ))[\,*[[A-Za-z-üצח?]*\s*]*\,*]*');
%display(path_2);
path_3              = strcat('[[[A-Za-z-üצח?]*]*\,{1}\s{2}]*(?=(,  )[[A-Za-z-üצח?]*\s*]*(', LastName{1});
path_4              = strcat(path_3, '))');   
%reg_path            =[path_1 LastName path_2];

part_1              =[regexp(source_code,path_4, 'match')];
part_1              =[regexp(part_1{1},'[\,*\s*\n*[[A-Za-z-üצח?]*\S*\n*]*\,*]*(?=\,*)','match')];
part_2              =[regexp(source_code, path_2, 'match')];
part_2              =[regexp(part_2{1},'[\,*\s*\n*[[A-Za-z-üצח?]*\S*\n*]*\,*]*(?=\,*)','match')];

a=numel(part_1);
b=numel(part_2);
% display(a);
% display(b);
B=[];
if numel(part_1)>0 &&  numel(part_2)>0;
B              =[char(part_1{1}) ',  ' char(part_2{1}) ',  ' char(AuthorName{1}) ','];
elseif numel(part_1)>0 && numel(part_2)==0;
B              =[char(part_1{1})  ',  ' char(AuthorName{1}) ','];
elseif numel(part_2)>0 && numel(part_1)==0;
B              =[char(part_2{1})  ',  ' char(AuthorName{1}) ','];
end
%display(part_1{1});
%display(part_2{1});


%display(B);

if numel(B)==0;
 
   ListCoAuthorNames =AuthorName;
else
    ListCoAuthorNames   = [regexp(B, '[[\w.-\w]*\s*]*(?=(,))', 'match')];
end
    



citation_number= (regexp(source_code,'(?<=(Cited by ))[\d]*', 'match'));
CitationNumber=str2num(citation_number{1});

end 