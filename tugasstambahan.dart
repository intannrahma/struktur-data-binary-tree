import 'dart:collection';
import 'dart:io';

class Node<T> { // Class generik untuk merepresentasikan satu simpul (node) di binary tree.
  T nodeValue;
  Node<T>? left, right; //Punya nilai (nodeValue) dan 2 anak (left dan right).
  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null; //titik awal pohon menginisialisasi pohon kosong
    
  }

  // Traversal Preorder
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
    printPostOrder(root);
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

  // 1. Penambahan node menggunakan Queue (Level Order insert)
  void insertDataQueue(T newValue) {
    Node<T> newNode = Node<T>(newValue);
    if (root == null) {
      root = newNode;
      return;
    }

    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> temp = queue.removeFirst();

      if (temp.left == null) {
        temp.left = newNode;
        return;
      } else {
        queue.add(temp.left!);
      }

      if (temp.right == null) {
        temp.right = newNode;
        return;
      } else {
        queue.add(temp.right!);
      }
    }
  }

  // 2. Insert berdasarkan target dengan linear search
  void insertByTarget(T target, T newValue) {
    if (root == null) return;

    Node<T> newNode = Node(newValue);
    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();

      if (current.nodeValue == target) {
        if (current.left == null) {
          current.left = newNode;
          return;
        } else if (current.right == null) {
          current.right = newNode;
          return;
        }
      }

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
  }

  // 3. Traversal non-rekursif dengan stack
 void inOrderNonRekursif(Node<T>? node) {
  // Stack untuk menyimpan node yang belum diproses
  List<Node<T>> stack = [];
  // Mulai dari node root
  Node<T>? current = node;

  // Selama current tidak null atau masih ada node di stack
  while (current != null || stack.isNotEmpty) {
    // Iterasi ke paling kiri dari subtree saat ini
    while (current != null) {
      stack.add(current);    // Simpan node ke stack
      current = current.left; // Pindah ke anak kiri
    }

    // Jika sudah sampai paling kiri, ambil node terakhir dari stack
    current = stack.removeLast();
    // Proses node tersebut (tampilkan nilai node)
    stdout.write("${current.nodeValue} ");
    // Lanjutkan ke subtree kanan dari node tersebut
    current = current.right;
  }
  // Tambah baris baru setelah selesai traversal
  print("");
}


  void preOrderNonRekursif(Node<T>? node) {
    if (node == null) return;

    List<Node<T>> stack = []; //menginisialisasi
    stack.add(node);    

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      stdout.write("${current.nodeValue} "); // cetak nilai node

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
    print("");
  }

  void postOrderNonRekursif(Node<T>? node) {
    if (node == null) return;

    List<Node<T>> stack = [node];
    List<T> result = [];

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      result.insert(0, current.nodeValue);

      if (current.left != null) stack.add(current.left!);
      if (current.right != null) stack.add(current.right!);
    }

    for (var val in result) {
      stdout.write("$val ");
    }
    print("");
  }

  void printLevelOrder() {
    int h = tinggi(root);
    for (int i = 0; i < h; i++) {
      printCurrentLevel(root, i);
    }
  }

  int tinggi(Node<T>? root) {
    if (root == null) {
      return 0;
    } else {
      int ltinggi = tinggi(root.left);
      int rtinggi = tinggi(root.right);
      return ltinggi > rtinggi ? ltinggi + 1 : rtinggi + 1;
    }
  }

  void printCurrentLevel(Node<T>? root, int level) {
    if (root != null) {
      if (level == 0) {
        print('${root.nodeValue}');
      } else if (level > 0) {
        printCurrentLevel(root.left, level - 1);
        printCurrentLevel(root.right, level - 1);
      }
    }
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
}

void main() {
  BinaryTree btree = BinaryTree();

  btree.insertData(1);
  btree.insertData(2);
  btree.insertData(3);
  btree.insertData(4);
  btree.insertData(5);
  btree.insertData(6);
  
  print("\nIn Order Traversal Binary Tree:");
  btree.printInOrderFromRoot();

  print("\nKedalaman Binary Tree: ${btree.maxDepth(btree.root)}\n");

  btree.insertByTarget(3, 99);

  print("InOrder Non Rekursif:");
  btree.inOrderNonRekursif(btree.root);

  print("PreOrder Non Rekursif:");
  btree.preOrderNonRekursif(btree.root);
  print("non rekursif")

  print("PostOrder Non Rekursif:");
  btree.postOrderNonRekursif(btree.root);

  print("\nKedalaman akhir: ${btree.maxDepth(btree.root)}");
}

