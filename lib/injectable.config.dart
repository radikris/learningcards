// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:learningcards/app/app_config.dart' as _i3;
import 'package:learningcards/features/following/application/bloc/following_bloc.dart'
    as _i8;
import 'package:learningcards/features/following/data/following_repository_impl.dart'
    as _i7;
import 'package:learningcards/features/following/domain/following_repository.dart'
    as _i6;
import 'package:learningcards/network/api.dart' as _i5;
import 'package:learningcards/network/dio_client.dart' as _i9;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioInjectableModule = _$DioInjectableModule();
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Config>(
      _i3.ConfigDev(),
      registerFor: {_dev},
    );
    gh.singleton<_i3.Config>(
      _i3.ConfigProd(),
      registerFor: {_prod},
    );
    gh.factory<_i4.Dio>(() => dioInjectableModule.getDio(gh<_i3.Config>()));
    gh.factory<_i5.ApiClient>(() => registerModule.getService(
          gh<_i4.Dio>(),
          gh<_i3.Config>(),
        ));
    gh.lazySingleton<_i6.FollowingRepository>(
      () => _i7.FollowingRepositoryImpl(gh<_i5.ApiClient>()),
      registerFor: {_prod},
    );
    gh.factory<_i8.FollowingBloc>(() =>
        _i8.FollowingBloc(followingRepository: gh<_i6.FollowingRepository>()));
    return this;
  }
}

class _$DioInjectableModule extends _i9.DioInjectableModule {}

class _$RegisterModule extends _i5.RegisterModule {}
