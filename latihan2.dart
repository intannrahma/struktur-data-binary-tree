import 'dart:io';

class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  // Menambahkan node ke BST
  void insert(int value) {
    root = _insertNode(root, value);
  }

  Node _insertNode(Node? node, int value) {
    if (node == null) return Node(value);

    if (value < node.data) {
      node.left = _insertNode(node.left, value);
    } else {
      node.right = _insertNode(node.right, value);
    }

    return node;
  }

  // Method untuk menyalin tree dari node t
  Node? copyTree(Node? t) {
    if (t == null) return null;

    Node newNode = Node(t.data);
    newNode.left = copyTree(t.left);
    newNode.right = copyTree(t.right);
    return newNode;
  }

  // Menampilkan tree secara inorder
  void inorderTraversal(Node? node) {
    if (node != null) {
      inorderTraversal(node.left);
      stdout.write('${node.data} ');
      inorderTraversal(node.right);
    }
  }
}

void main() {
  BinarySearchTree tree1 = BinarySearchTree();
  tree1.insert(40);
  tree1.insert(20);
  tree1.insert(60);
  tree1.insert(10);
  tree1.insert(30);
  tree1.insert(50);
  tree1.insert(70);

  print('Inorder Tree 1:');
  tree1.inorderTraversal(tree1.root);
  print('');

  // Menyalin tree1 ke tree2
  BinarySearchTree tree2 = BinarySearchTree();
  tree2.root = tree2.copyTree(tree1.root);

  print('Inorder Tree 2 (salinan dari Tree 1):');
  tree2.inorderTraversal(tree2.root);
  print('');
}
