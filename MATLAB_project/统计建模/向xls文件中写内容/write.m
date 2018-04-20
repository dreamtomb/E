%% 向xls文件中写内容
txt={'','daming','哈哈';'haha','','';'大名','',''};
xlswrite('test.xlsx',txt,1,'A1');
a=magic(2);
xlswrite('test.xlsx',a,1,'B2');
