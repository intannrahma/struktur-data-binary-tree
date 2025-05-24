class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;
}

void printPreOrder(Node? node) {
  if (node != null) {
    print("${node.nodeValue}");
    printPreOrder(node.left);
    printPreOrder(node.right);
  } else {
    print("Binary Tree Kosong");
  }
}

void printInOrder(Node? node) {
  if (node != null) {
    printInOrder(node.left);
    print("${node.nodeValue}");
    printInOrder(node.right);
  } else {
    print("Binary Tree Kosong");
  }
}

void printPostOrder(Node? node) {
  if (node != null) {
    printPostOrder(node.left);
    printPostOrder(node.right);
    print("${node.nodeValue}");
  } else {
    print("Binary Tree Kosong");
  }
}

void main() {
  var BTree = BinaryTree<dynamic>();
  BTree.root = Node(1);
  BTree.root!.left = Node(2);
  BTree.root!.left!.left = Node(3);
  BTree.root!.left!.right = Node(4);


  BTree.root!.left!.left = Node("a");

  print("Pre Order Traversal Binary Tree:");
  printPreOrder(BTree.root);

  print("\nIn Order Traversal Binary Tree:");
  printInOrder(BTree.root);

  print("\nPost Order Traversal Binary Tree:");
  printPostOrder(BTree.root);
}
