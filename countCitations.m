function RealCitations= countCitations(topicLabel)
 ListTopicAuthors = getTopicAuthors(topicLabel);
 ListArticles=cell(1,numel(ListTopicAuthors.AuthorID));
 for i=1:numel(ListTopicAuthors.AuthorID);%get articles of each author 
     ListArticles{i}=getArticles(ListTopicAuthors.AuthorID{i});%list articles of specific author
     ListSelfCitations = cell(1,numel(ListArticles{i}.ArticleID));
     ListSelfCitations{i}=cell(1,numel(ListArticles{i}.CoAuthorNames));
     for j=1:numel(ListArticles{i}.CoAuthorNames);
         ListSelfCitations{i}=getSelfCitations(ListArticles{i}.CitationID{1}, ListArticles{i}.CoAuthorNames{j});
     end
 end
     
RealCitations=0;
end