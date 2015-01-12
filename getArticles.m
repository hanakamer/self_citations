function ListArticles = getArticles(AuthorID)
% Creates a list of articles <ListArticles> containing the fields:
% <ArticleID>
% <CitationNUM>
% <CoAuthorNames>   : use getCoAuthors(AuthorID,ArticleID) to get this
% <CitationID>      : use getCoAuthors(AuthorID,ArticleID) to get this 

baseURL     = 'http://scholar.google.ch/citations?user=';
targetURL   = [baseURL AuthorID];
% disp(targetURL);
source_code = urlread(targetURL);


ListArticles.ArticleID      = [regexp(source_code,'(?<=(citation_for_view=)\S*(:))[[\w-]{12}]*', 'match')];
ListArticles.CitationNUM    = [regexp(source_code,'(?<=(cites=)[\d*(,*)]*(">))[\d]*','match' )];
%[CitationID,ListCoAuthorNames]= getCoAuthors(AuthorID, ListArticles.ArticleID{1});


ListArticles.CoAuthorNames=cell(1,numel(ListArticles.ArticleID));
ListArticles.CitationID=cell(1,numel(ListArticles.ArticleID));
 
 for i=1:numel(ListArticles.ArticleID);
    display(ListArticles.ArticleID{i});
    [ListArticles.CitationID{i}, ListArticles.CoAuthorNames{i},CitationNumber ]        =getCoAuthors(AuthorID,ListArticles.ArticleID{i});
         
 end;

%ListArticles.CoAuthorNames  = [ListCoAuthorNames];
%display(ListAticles.CoAuthorNames);

end 