function [examples,targets,test_examples] = fold(e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10)

examples = {};
targets = {};

%This below is really ugly
%I was debugging something so I went for brute force and ignorance
%but it worked so I don't want to touch it now

examples = [examples, [e2; e3; e4; e5; e6; e7; e8; e9; e10]];
targets = [targets, [t2; t3; t4; t5; t6; t7; t8; t9; t10]];

examples = [examples, [e1; e3; e4; e5; e6; e7; e8; e9; e10]];
targets = [targets, [t1; t3; t4; t5; t6; t7; t8; t9; t10]];

examples = [examples, [e1; e2; e4; e5; e6; e7; e8; e9; e10]];
targets = [targets, [t1; t2; t4; t5; t6; t7; t8; t9; t10]];

examples = [examples, [e1; e2; e3; e5; e6; e7; e8; e9; e10]];
targets = [targets, [t1; t2; t3; t5; t6; t7; t8; t9; t10]];

examples = [examples, [e1; e2; e3; e4; e6; e7; e8; e9; e10]];
targets = [targets, [t1; t2; t3; t4; t6; t7; t8; t9; t10]];

examples = [examples, [e1; e2; e3; e4; e5; e7; e8; e9; e10]];
targets = [targets, [t1; t2; t3; t4; t5; t7; t8; t9; t10]];

examples = [examples, [e1; e2; e3; e4; e5; e6; e8; e9; e10]];
targets = [targets, [t1; t2; t3; t4; t5; t6; t8; t9; t10]];

examples = [examples, [e1; e2; e3; e4; e5; e6; e7; e9; e10]];
targets = [targets, [t1; t2; t3; t4; t5; t6; t7; t9; t10]];

examples = [examples, [e1; e2; e3; e4; e5; e6; e7; e8; e10]];
targets = [targets, [t1; t2; t3; t4; t5; t6; t7; t8; t10]];

examples = [examples, [e1; e2; e3; e4; e5; e6; e7; e8; e9]];
targets = [targets, [t1; t2; t3; t4; t5; t6; t7; t8; t9]];

test_examples = {e1, e2, e3, e4, e5, e6, e7, e8, e9, e10};

end

