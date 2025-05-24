import 'dart:collection';

class Node<T> {
  T key;
  Node<T>? left;
  Node<T>? right;

  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left);
      print('${node.key} ');
      printInOrder(node.right);
    }
  }

  void printInOrderFromRoot() {
    printInOrder(root);
  }

  int maxDepth(Node<T>? node) {
    if (node == null) {
      return 0;
    } else {
      int lDepth = maxDepth(node.left);
      int rDepth = maxDepth(node.right);
      return lDepth > rDepth ? lDepth + 1 : rDepth + 1;
    }
  }

  int height(Node<T>? node) {
    return maxDepth(node);
  }

  void printCurrentLevel(Node<T>? node, int level) {
    if (node != null) {
      if (level == 0) {
        print('${node.key} ');
      } else if (level > 0) {
        printCurrentLevel(node.left, level - 1);
        printCurrentLevel(node.right, level - 1);
      }
    }
  }

  void printLevelOrder() {
    int h = height(root);
    for (int i = 0; i < h; i++) {
      printCurrentLevel(root, i);
    }
  }

  void deleteDeepest(Node<T> root, Node<T> delNode) {
    Queue<Node<T>> q = Queue();
    q.add(root);
    Node<T>? temp;
    while (q.isNotEmpty) {
      temp = q.removeFirst();
      if (temp == delNode) {
        temp = null;
        return;
      }
      if (temp.right != null) {
        if (temp.right == delNode) {
          temp.right = null;
          return;
        } else {
          q.add(temp.right!);
        }
      }
      if (temp.left != null) {
        if (temp.left == delNode) {
          temp.left = null;
          return;
        } else {
          q.add(temp.left!);
        }
      }
    }
  }

  void delete(Node<T>? root, T key) {
    if (root == null) {
      return;
    }
    if (root.left == null && root.right == null) {
      if (root.key == key) {
        this.root = null;  // update root node of tree
      }
      return;
    }

    Queue<Node<T>> q = Queue();
    q.add(root);
    Node<T>? temp;
    Node<T>? keyNode;

    while (q.isNotEmpty) {
      temp = q.removeFirst();

      if (temp.key == key) {
        keyNode = temp;
      }

      if (temp.left != null) {
        q.add(temp.left!);
      }
      if (temp.right != null) {
        q.add(temp.right!);
      }
    }

    if (keyNode != null && temp != null) {
      keyNode.key = temp.key;
      deleteDeepest(root, temp);
    }
  }
}

void main() {
  BinaryTree<int> t = BinaryTree();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("In Order traversal of binary tree is: ");
  t.printInOrderFromRoot();

  print("\nHeight of Binary Tree: ${t.maxDepth(t.root)}");

  t.delete(t.root, 19);  
  
  print("\nIn Order traversal of binary tree after deletion attempt: ");
  t.printInOrderFromRoot();

  print("\nNilai pada Level Tertentu pada Binary Tree (level 1): ");
  t.printCurrentLevel(t.root, 1);
}
