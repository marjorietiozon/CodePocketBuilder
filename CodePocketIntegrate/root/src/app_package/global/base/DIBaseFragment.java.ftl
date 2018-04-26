/**
 * @author github.com/jamesdeperio
 * @version codepocket template builder v1.0
 */
package ${packageName}.global.base;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import butterknife.Unbinder;
import dagger.android.AndroidInjector;
import dagger.android.DispatchingAndroidInjector;
import dagger.android.support.AndroidSupportInjection;
import dagger.android.support.HasSupportFragmentInjector;
import jdp.pocketlib.base.BaseFragment;
import javax.inject.Inject;
import java.util.HashSet;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;


public abstract class DIBaseFragment extends BaseFragment implements HasSupportFragmentInjector {
    @Inject  DispatchingAndroidInjector<Fragment> childFragmentInjector;
    public HashSet<Unbinder> binder= new HashSet<>();
    public ViewGroup container;

   @Override
   public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        this.container= container;
        AndroidSupportInjection.inject(this);
        return super.onCreateView(inflater, container, savedInstanceState);
    }


    @Override
    public void onDestroy() {
        super.onDestroy();
           for (Unbinder unbinder : binder)
                unbinder.unbind();

    }

    @Override
    public AndroidInjector<Fragment> supportFragmentInjector() {
        return childFragmentInjector;
    }
}