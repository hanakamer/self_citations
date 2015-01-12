function ListTopicAuthors = getTopicAuthors(topicLabel)
% Crowls GS(Google Scholar) based on the <topicLabel> and returns a list 
% structure with the fields
% <AuthorName>
% <AuthorID>

baseURL     = 'http://scholar.google.ch/citations?view_op=search_authors&hl=en&mauthors=label:';
targetURL   = [baseURL topicLabel];
source_code =urlread(targetURL);

ListTopicAuthors.AuthorName=[regexp(source_code,'(?<=(?user=)\S*(&amp;hl=en">))[[A-Za-z.-]*\s*}]*(?=(</a>))', 'match')];
ListTopicAuthors.AuthorID=[regexp(source_code,'(?<=(<a href="/citations\?user=))[[\w-]{12}]*', 'match')];
end 