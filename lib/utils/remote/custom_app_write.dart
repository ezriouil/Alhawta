import 'package:alhawta/utils/constants/custom_api.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

class CustomAppWrite {
  CustomAppWrite._();

  // - - - - - - - - - - - - - - - - - - INSERT - - - - - - - - - - - - - - - - -  //
  static Future<Map<String, dynamic>> insert({
        required Databases databases,
        required String collectionId,
        required String documentId,
        required Map<String, dynamic> data})
  async {
    final result = await databases.createDocument(
        databaseId: CustomApi.appWriteDatabaseId,
        collectionId: collectionId,
        documentId: documentId,
        data: data
    );
    return result.data;
  }

    // - - - - - - - - - - - - - - - - - - GET ALL - - - - - - - - - - - - - - - - - -  //
  static Future<List<Document>> getAll({
    required Databases databases,
    required String collectionId,
    List<String>? queries})
  async {
    final response = await databases.listDocuments(
      databaseId: CustomApi.appWriteDatabaseId,
      collectionId: collectionId,
      queries: queries
    );
    return response.documents;
  }

  // - - - - - - - - - - - - - - - - - - GET ONE - - - - - - - - - - - - - - - - - -  //
  static Future<Map<String, dynamic>> getOne({
    required Databases databases,
    required String collectionId,
    required String documentId,
    List<String>? queries})
  async {
    final response = await databases.getDocument(
      databaseId: CustomApi.appWriteDatabaseId,
      collectionId: collectionId,
      documentId: documentId,
      queries: queries
    );
    return response.data;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE- - - - - - - - - - - - - - - - - -  //
  static Future<Map<String, dynamic>> update({
    required Databases databases,
    required String collectionId,
    required String documentId,
    required Map<String, dynamic> newData})
  async {
    final response = await databases.updateDocument(
        databaseId: CustomApi.appWriteDatabaseId,
        collectionId: collectionId,
        documentId: documentId,
        data: newData
    );
    return response.data;
  }

  // - - - - - - - - - - - - - - - - - - DELETE- - - - - - - - - - - - - - - - - -  //
  static void delete({
    required Databases databases,
    required String collectionId,
    required String documentId,
    required Map<String, dynamic> newData})
  async {
    await databases.deleteDocument(
      databaseId: CustomApi.appWriteDatabaseId,
      collectionId: collectionId,
      documentId: documentId,
    );
  }

}