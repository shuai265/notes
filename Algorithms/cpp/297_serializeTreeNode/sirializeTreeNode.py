# Definition for a binary tree node.
# -*endo*-


class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Codec:

    def serialize(self, root):
        """ Encodes a tree to a single string.
        :type root: TreeNode
        :rtype: str
        """
        def rserialize(root, string):
            if root is None:
                string += "None,"
            else:
                string += str(root.val) + ","
                string = rserialize(root.left, string)
                string = rserialize(root.right, string)
            return string
        
        return rserialize(root, "")

    def deserialize(self, data):
        """Decodes your encoded data to tree.
        
        :type data: str
        :rtype: TreeNode
        """
        def rdeserialize(l):
            if len(l) == 0:
                return
            if l[0] == "None":
                l.pop(0)
                return None
            
            root = TreeNode(l[0])
            l.pop(0)
            root.left = rdeserialize(l)
            root.right = rdeserialize(l)
            return root

        data_list = data.split(',')
        print "data_list", data_list
        root = rdeserialize(data_list)
        return root


# by level
class Codec2:
    def serialize(self, root):
        """Encodes a tree to a single string.
        
        :type root: TreeNode
        :rtype: str
        """
        result = []
        self.serializeHelper([root], result)

        ansList = []
        for node in result:
            ansList.append(",")
            if node is None:
                ansList.append("null")
            else:
                ansList.append(str(node.val))
        if len(ansList) > 0:        
            ansList[0] = "["
            ansList.append("]")
        else:
            ansList.append("[")
            ansList.append("]")
        ans = "".join(ansList)
        return ans
    
    def serializeHelper(self, nodeList, result):
        nextNodeList = []
        allNone = True
        current = []
        for node in nodeList:
            current.append(node)
            if node is not None:
                nextNodeList.append(node.left)
                nextNodeList.append(node.right)

        if len(nextNodeList) > 0:
            result.extend(current)
            self.serializeHelper(nextNodeList, result)
        
        
    def deserialize(self, data):
        """Decodes your encoded data to tree.
        
        :type data: str
        :rtype: TreeNode
        """
        t = list(data)
        t.pop()
        t.pop(0)
        ans = "".join(t)
        if len(ans) > 0:
            valList = ans.split(",")

            if len(valList) > 0:
                node = TreeNode(int(valList[0]))
                self.deserializeHelper(valList, [node], 1)
                return node
        
        return None


    def deserializeHelper(self, valList, nodeList, startPos):
        nodeCnt = len(nodeList)
        cnt = nodeCnt*2
        nextNodeList = []

        if startPos >= len(valList):
            return 

        for i in range(nodeCnt):
            node = nodeList[i]
            if node is not None:
                leftVal = valList[startPos+2*i]
                if leftVal == "null":
                    nextNodeList.append(None)
                else:
                    node.left = TreeNode(int(leftVal))
                    nextNodeList.append(node.left)

                rightVal = valList[startPos+2*i+1]
                if rightVal == "null":
                    nextNodeList.append(None)
                else:
                    node.right = TreeNode(int(rightVal))
                    nextNodeList.append(node.right)
                # print "node=",node.val,"left=",leftVal,"right=",rightVal,"startPos=",startPos,",i=",i

        if startPos+cnt < len(valList):
            self.deserializeHelper(valList, nextNodeList, startPos+cnt)
        

def printNode(nodeList):
    nextNodeList = []
    current = []
    needContinue = False
    for node in nodeList:
        if node is None:
            current.append(None)
            nextNodeList.append(None)
            nextNodeList.append(None)
        else:
            needContinue = True
            current.append(node.val)
            nextNodeList.append(node.left)
            nextNodeList.append(node.right)
    print current
    if needContinue:
        printNode(nextNodeList)


# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.deserialize(codec.serialize(root))

root = TreeNode(1)
root.left = TreeNode(2)
right = TreeNode(3)
root.right = right
right.left = TreeNode(4)
right.right = TreeNode(5)

ans = Codec().serialize(root)
# print ans

# data = "[1,2,3,null,null,4,5]"
# data = "[]"
# data = "[1]"
data = "[5,2,3,null,null,2,4,3,1]"
node = Codec().deserialize(data)
# node = Codec().deserialize(ans)
printNode([node])

dataStr = Codec().serialize(node)
print "dataStr=", dataStr

# printNode([node])