function AuthorName=getAuthorName(AuthorID)
targetURL       = ['http://scholar.google.ch/citations?user=' AuthorID '&hl=en'];
%display(targetURL);
source_code     = urlread(targetURL);
AuthorName      = [regexp(source_code,'(?<=(<head><title>))[[\w.-]*\s*]*(?=(-))', 'match')];
%display(AuthorName);
end