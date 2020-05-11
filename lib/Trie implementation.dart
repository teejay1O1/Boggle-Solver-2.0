import 'dart:collection';

class TrieNode {
  HashMap children=HashMap<String, TrieNode>();
  bool isTerminal;
  String char;
  TrieNode(String chr) {
    char = chr;
    isTerminal = false;
  }
}

class Trie {
  TrieNode root = TrieNode(null);

  void addWord(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      if (node.children.containsKey(word[i])) {
        node = node.children[word[i]];
      } 
      else {
        TrieNode newNode = TrieNode(word[i]);
        node.children[word[i]] = newNode;
        node = node.children[word[i]];
      }
    }
    node.isTerminal = true;
  }

  bool searchWord(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      if (node.children.containsKey(word[i])) {
        node = node.children[word[i]];
      } else {
        return false;
      }
    }
    return node.isTerminal;
  }

}

// //  TEST 
// void main(List<String> args) {
//   Trie obj = Trie();

//   obj.addWord("hey");

//   obj.addWord("nope");
//   obj.addWord("hi");
//   obj.addWord("hello");

//   obj.addWord("no");
//   obj.addWord("yes");

//   print(obj.searchWord("hello"));
//   print(obj.searchWord("why"));
//   print(obj.searchWord("hi"));
//   print(obj.searchWord("hell"));
// }
