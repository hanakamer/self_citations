function NUMSelfCit = getSelfCitations(CitationID,AuthorName)
% Gets the number of citations for a given article <CitationID> 
% that do not include the <AuthorName> in their authors:

%targetURL     = ['http://scholar.google.ch/scholar?q=author%3A'...
%                AuthorID '&btnG=&hl=en&as_sdt=0%2C5&sciodt=0%2C5&cites='...
%                CitationID '&scipsc=1'];

ModifiedName    = modifyName(AuthorName);
Sliced_Name     = regexp(ModifiedName, '(?<=[[A-Za-z-.]\s*]*)[A-Za-z-.]*','match');
part_1          =Sliced_Name{1};
part_2          =Sliced_Name{2};
targetURL      = ['http://scholar.google.ch/scholar?as_q=&as_epq=&as_oq=&as_eq=&as_occt=any&as_sauthors=' part_1 '+' part_2 '&as_publication=&as_ylo=&as_yhi=&btnG=&hl=en&as_sdt=0%2C5&sciodt=0%2C5&cites=' CitationID '&scipsc=1'];
source_code =urlread(targetURL);

results =[regexp(source_code, '\d*(?=( results))', 'match')];
if numel(results)==0;
    results =[regexp(source_code, '\d*(?=( result))', 'match')];
    if numel(results)==0;
        NUMSelfCit= 0;
    else
        NUMSelfCit    =str2num(results{1});  
    end
    
else
    NUMSelfCit    =str2num(results{1});
    
end

%<NUMSelfCit> is found in this page as 
%About <NUMSelfCit> results (0.04 sec)

end 