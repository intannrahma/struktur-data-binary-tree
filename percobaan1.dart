import 'dart:collection';
import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

  // Travesal Preorder
  void printPreOrder(Node<T>? node) {
    if (node != null) {
      stdout.write("${node.nodeValue} "); // N (node/root)
      printPreOrder(node.left); // L (left)
      printPreOrder(node.right); // R (right)
    }
  }
  
  void printPreOrderFromRoot() {
    printPreOrder(root);
  }

  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left); // L (left)
      stdout.write("${node.nodeValue} "); // N (node/root)
      printInOrder(node.right); // R (right)
    }
  }
  
  void printInOrderFromRoot() {
    printInOrder(root);
  }

  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left); // L (left)
      printPostOrder(node.right); // R (right)
      stdout.write("${node.nodeValue} "); // N (node/root)
    }
  }
  
  void printPostOrderFromRoot() {
    printPostOrder(root); // Memperbaiki pemanggilan fungsi yang salah
  }

  void insertData(T newValue) {
    Node<T> newNode = Node<T>(newValue);
    if (root == null) {
      root = newNode;
      return;
    } else {
      insertBasedOrderLevel(root!, newNode);
    }
  }

  bool insertBasedOrderLevel(Node<T> current, Node<T> newNode) {
    if (current.left == null) {
      current.left = newNode;
      return true;
    }
    if (current.right == null) {
      current.right = newNode;
      return true;
    }
    return insertBasedOrderLevel(current.left!, newNode) || 
           insertBasedOrderLevel(current.right!, newNode);
  }

  }
  
  void main() {
  BinaryTree<int> btree = BinaryTree();
  
  btree.insertData(1);
  btree.insertData(2);
  btree.insertData(3);
  btree.insertData(4);
  btree.insertData(5);
  btree.insertData(6);

  print("Pre Order Traversal Binary Tree: ");
  btree.printPreOrder(btree.root);

  print("");
  print("In Order Traversal Binary Tree: ");
  btree.printInOrder(btree.root);

  print("");
  print("Post Order Traversal Binary Tree: ");
  btree.printPostOrder(btree.root);
}
