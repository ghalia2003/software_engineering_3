import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/api.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'loan_state.dart';

class LoanCubit extends Cubit<LoanState> {
  LoanCubit() : super(LoanInitial());

  String message = '';
  String id = '';
  String totalAmount = '';
  String monthlyInstallment = '';
  String type = '';


  Future<bool> postLoan() async {
   
    emit(LoanLoading());

    Map<String, dynamic> formMap = {
      type: id,
      'TotalAmount': totalAmount,
      'MonthlyInstallment':monthlyInstallment,
    };

    
    var response = await ApiService.post(
      endPoint: 'loans',
      data: FormData.fromMap(formMap),
    );

    if (response['success']) {
      emit(LoanSuccess());
      message = 'Done';
      return true;
    } else {
      message = 'Not Done';
      emit(LoanFailure(errorMessage: response['error']));
      return false;
    }
  }
}