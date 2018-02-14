function [class, final_depth] = get_class(tree, example, curr_depth)

% we are done when we get a leaf
if isempty(tree.kids)
    class = tree.class;
    final_depth = curr_depth;
% otherwise keep recursing through
% check attributes for correct decision at each node
else
    [class, final_depth] = get_class(tree.kids{example(tree.op)+1}, example, curr_depth+1);
end

end

