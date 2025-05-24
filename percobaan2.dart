import 'dart:collection';
import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  void insertLevelOrder(T data) {
    Node<T> newNode = Node(data);
    if (root == null) {
      root = newNode;
      return;
    }

    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();

      if (current.left == null) {
        current.left = newNode;
        return;
      } else {
        queue.add(current.left!);
      }

      if (current.right == null) {
        current.right = newNode;
        return;
      } else {
        queue.add(current.right!);
      }
    }
  }

  // Tambah berdasarkan target value
  void insertBasedOnTarget(T target, T data) {
    if (root == null) return;

    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();

      if (current.nodeValue == target) {
        if (current.left == null) {
          current.left = Node(data);
          return;
        } else if (current.right == null) {
          current.right = Node(data);
          return;
        }
      }

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
  }

  void printPreOrder(Node<T>? node) {
    if (node != null) {
      stdout.write("${node.nodeValue} ");
      printPreOrder(node.left);
      printPreOrder(node.right);
    }
  }

  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write("${node.nodeValue} ");
      printInOrder(node.right);
    }
  }

  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left);
      printPostOrder(node.right);
      stdout.write("${node.nodeValue} ");
    }
  }

  void inOrderNonRekursif() {
    if (root == null) return;

    List<Node<T>> stack = [];
    Node<T>? curr = root;

    while (curr != null || stack.isNotEmpty) {
      while (curr != null) {
        stack.add(curr);
        curr = curr.left;
      }

      curr = stack.removeLast();
      stdout.write('${curr.nodeValue} ');
      curr = curr.right;
    }
  }

  void preOrderNonRekursif() {
    if (root == null) return;

    List<Node<T>> stack = [root!];

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      stdout.write('${current.nodeValue} ');

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
  }

  void postOrderNonRekursif() {
    if (root == null) return;

    List<Node<T>> stack1 = [root!];
    List<Node<T>> stack2 = [];

    while (stack1.isNotEmpty) {
      Node<T> current = stack1.removeLast();
      stack2.add(current);

      if (current.left != null) stack1.add(current.left!);
      if (current.right != null) stack1.add(current.right!);
    }

    while (stack2.isNotEmpty) {
      stdout.write('${stack2.removeLast().nodeValue} ');
    }
  }
}

void main() {
  BinaryTree<int> btree = BinaryTree();

  btree.insertLevelOrder(1);
  btree.insertLevelOrder(2);
  btree.insertLevelOrder(3);
  btree.insertBasedOnTarget(2, 4);
  btree.insertBasedOnTarget(3, 5);
  btree.insertLevelOrder(6);

  print("Pre Order Rekursif: ");
  btree.printPreOrder(btree.root);

  print("\nIn Order Rekursif: ");
  btree.printInOrder(btree.root);

  print("\nPost Order Rekursif: ");
  btree.printPostOrder(btree.root);

  print("\n\nIn Order Non-Rekursif: ");
  btree.inOrderNonRekursif();

  print("\nPre Order Non-Rekursif: ");
  btree.preOrderNonRekursif();

  print("\nPost Order Non-Rekursif: ");
  btree.postOrderNonRekursif();
}

