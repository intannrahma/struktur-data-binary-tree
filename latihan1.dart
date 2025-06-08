import 'dart:io';

class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  // Method untuk menambahkan node ke dalam BST
  void insert(int value) {
    root = _insertNode(root, value);
  }

  Node _insertNode(Node? node, int value) {
    if (node == null) {
      return Node(value);
    }

    if (value < node.data) {
      node.left = _insertNode(node.left, value);
    } else {
      node.right = _insertNode(node.right, value);
    }

    return node;
  }

  // Method untuk mendapatkan nilai terbesar (right-most node)
  int? last() {
    if (root == null) return null;

    Node current = root!;
    while (current.right != null) {
      current = current.right!;
    }
    return current.data;
  }

  // Inorder traversal untuk melihat isi tree
  void inorderTraversal() {
    _inorderTraversal(root);
    print(''); // Untuk newline setelah traversal
  }

  void _inorderTraversal(Node? node) {
    if (node != null) {
      _inorderTraversal(node.left);
      stdout.write('${node.data} ');
      _inorderTraversal(node.right);
    }
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();

  // Tambahkan beberapa data ke BST
  bst.insert(40);
  bst.insert(20);
  bst.insert(60);
  bst.insert(10);
  bst.insert(30);
  bst.insert(50);
  bst.insert(70);

  // Cetak isi BST dengan inorder traversal
  print('Inorder Traversal (urutan dari kecil ke besar):');
  bst.inorderTraversal();

  // Cetak nilai terbesar
  print('Nilai terbesar dalam BST adalah: ${bst.last()}');
}

