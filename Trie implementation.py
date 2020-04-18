class TrieNode:
    def __init__(self,char,isTerminal=False):
        self.val=char
        self.children=dict()
        self.isTerminal=isTerminal
    
class Trie:
    def __init__(self):
        self.root=TrieNode(None)
    
    def addWord(self,word):
        node=self.root
        for char in word:
            if char not in node.children:
                node.children[char]=TrieNode(char)
            node=node.children[char]
        node.isTerminal=True
    
    def searchWord(self,word):
        node=self.root
        for char in word:
            if char in node.children:
                node=node.children[char]
            else:
                return False
        return node.isTerminal
    
# #TEST 
# obj=Trie()

# obj.addWord("hey")
# obj.addWord("nope")
# obj.addWord("hi")
# obj.addWord("hello")

# obj.addWord("no")
# obj.addWord("yes")

# print(obj.searchWord("hello"))
# print(obj.searchWord("why"))
# print(obj.searchWord("hi"))
# print(obj.searchWord("hell"))
# obj.searchWord("kyun")

           
