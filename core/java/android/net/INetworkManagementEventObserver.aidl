/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.net;

import android.net.LinkAddress;

/**
 * Callback class for receiving events from an INetworkManagementService
 *
 * @hide
 */
interface INetworkManagementEventObserver {
    /**
     * Interface configuration status has changed.
     *
     * @param iface The interface.
     * @param up True if the interface has been enabled.
     */
    void interfaceStatusChanged(String iface, boolean up);

    /**
     * Interface physical-layer link state has changed.  For Ethernet,
     * this method is invoked when the cable is plugged in or unplugged.
     *
     * @param iface The interface.
     * @param up  True if the physical link-layer connection signal is valid.
     */
    void interfaceLinkStateChanged(String iface, boolean up);

    /**
     * An interface has been added to the system
     *
     * @param iface The interface.
     */
    void interfaceAdded(String iface);

    /**
     * An interface has been removed from the system
     *
     * @param iface The interface.
     */
    void interfaceRemoved(String iface);


    /**
     * An interface address has been added or updated
     *
     * @param address The address.
     * @param iface The interface.
     * @param flags The address flags.
     * @param scope The address scope.
     */
    void addressUpdated(in LinkAddress address, String iface, int flags, int scope);

    /**
     * An interface address has been removed
     *
     * @param address The address.
     * @param iface The interface.
     * @param flags The address flags.
     * @param scope The address scope.
     */
    void addressRemoved(in LinkAddress address, String iface, int flags, int scope);

    /**
     * A networking quota limit has been reached. The quota might not
     * be specific to an interface.
     *
     * @param limitName The name of the limit that triggered.
     * @param iface The interface on which the limit was detected.
     */
    void limitReached(String limitName, String iface);

    /**
     * Interface data activity status is changed.
     *
     * @param iface The interface.
     * @param active  True if the interface is actively transmitting data, false if it is idle.
     */
    void interfaceClassDataActivityChanged(String label, boolean active);

    /**
     * Information about available DNS servers has been received.
     *
     * @param iface The interface on which the information was received.
     * @param lifetime The time in seconds for which the DNS servers may be used.
     * @param servers The IP addresses of the DNS servers.
     */
    void interfaceDnsServerInfo(String iface, long lifetime, in String[] servers);
}
